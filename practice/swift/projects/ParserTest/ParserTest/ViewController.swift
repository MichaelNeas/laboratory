//
//  ViewController.swift
//  ParserTest
//
//  Created by Michael Neas on 4/7/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import UIKit
import Down

class ViewController: UIViewController {
    @IBOutlet weak var mdView: UIView!
    @IBOutlet weak var htmlView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMarkdown()
        addHTML()
    }
    
    func addMarkdown() {
        let mdFile = Bundle.main.path(forResource: "nicetomeetya", ofType: "md")!
        let contents = try! String(contentsOfFile: mdFile)
        let downView = try! DownView(frame: mdView.bounds, markdownString: contents)
        mdView.addSubview(downView)
    }
    
    func addHTML() {
        let htmlFile = Bundle.main.path(forResource: "nicetomeetya", ofType: "html")!
        let contents = try! String(contentsOfFile: htmlFile)
        let htmlData = NSString(string: contents).data(using: String.Encoding.unicode.rawValue)
        let options = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
        ]
        
        let font = UIFont.systemFont(ofSize: 12)
        let boldFont = UIFont.boldSystemFont(ofSize: 14)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5
        
         let attributedHtml = try! NSMutableAttributedString(data: htmlData ?? Data(),
                                                                  options: options,
                                                                  documentAttributes: nil)
        
        attributedHtml.beginEditing()
        attributedHtml.enumerateAttribute(NSAttributedString.Key.font, in: NSRange(location:0, length: attributedHtml.length), options: NSAttributedString.EnumerationOptions(rawValue: 0), using: { (value, range, stop) in
                guard let value = value as? UIFont else { return }
                //let fontName = value.fontName.lowercased()
                var destinationFont = font
                let descriptor = value.fontDescriptor
                let symTraits = descriptor.symbolicTraits
                if symTraits.contains(UIFontDescriptor.SymbolicTraits.traitBold) {
                    destinationFont = boldFont
                }
                attributedHtml.removeAttribute(NSAttributedString.Key.font, range: range)
                attributedHtml.addAttribute(.font, value: destinationFont, range: range)
        })
        attributedHtml.endEditing()
        
        //attributedHtml.addAttributes(attributes, range: NSRange(location:0, length: attributedHtml.length))
        
        htmlView.attributedText = attributedHtml
    }
}

