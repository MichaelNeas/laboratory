//
//  ContentView.swift
//  PotentialDataDetection
//
//  Created by Michael Neas on 11/23/20.
//

import SwiftUI

struct ContentView: View {
    let text = "This is a test with the URL https://www.google.com to be detected. www.michaelneas.com we can have a bunch of different links and they can show up like www.mikeneas.com"
    
    var body: some View {
        return Group {
//            detectLink(input: text).reduce(Text(""), {
//                if $1.type == .link {
//                    $0 + $1.view.onTapGesture {
//                        print("HI")
//                    }
//                } else {
//                    $0 + $1.view
//                }
//            })
            GeometryReader { proxy in
                MyTextView(width: proxy.size.width, text: detectLink(input: text))
            }
            
            Text("hi dofnoi nfoi  ndf lifj lkdj flkjdlskjlkjlkj lfdksjllksjdflksjdlkfjsdlkjfsldkj l n lkdnflkn ") + Text("by ldn kn lknl knkl nlknklnl nlk jldkjfe")
        }
    }

    private func detectLink(input: String) -> NSAttributedString {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        let attributedString = NSMutableAttributedString(string: input)
//        var pointer = input.startIndex
        for match in matches {
            guard let range = Range(match.range, in: input) else { continue }
            let url = input[range]
            attributedString.addAttribute(.link, value: url, range: match.range)
            //segments.append(Linkable(content: String(url), type: .link))
            //pointer = range.upperBound
        }
        //segments.append(Linkable(content: String(input[pointer..<input.endIndex]), type: .regular))
        return attributedString
    }
}

struct MyTextView: UIViewRepresentable {
    var width: CGFloat
    var text: NSAttributedString

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = width
        label.attributedText = text
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLabel(tap:))))
        //label.text = "Here's a lot of text for you to display. It won't fit on the screen."
        return label
    }

    func updateUIView(_ view: UILabel, context: Context) {
    }
    
    @objc func tapLabel(tap: UITapGestureRecognizer) {
        guard let range = self.yourLabel.text?.range(of: "Substring to detect")?.nsRange else {
            return
        }
        if tap.didTapAttributedTextInLabel(label: self.yourLabel, inRange: range) {
            // Substring tapped
        }
    }
}


extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)

        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }

}

extension Range where Bound == String.Index {
    var nsRange:NSRange {
        return NSRange(location: self.lowerBound.encodedOffset,
                   length: self.upperBound.encodedOffset -
                    self.lowerBound.encodedOffset)
    }
}
