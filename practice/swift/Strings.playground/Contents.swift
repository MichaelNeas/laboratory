import UIKit

let name = "Mike"

for letter in name {
    print("Give me a \(letter)")
}

let letter = name[name.index(name.startIndex, offsetBy: 3)]

let letter2 = name[1]

let password = "987654789"
password.hasPrefix("987")
password.hasSuffix("789")

let weather = "it's going to rain"
print(weather.capitalizedFirst)
print(weather.capitalized)

let input = "Swift is like ObjC without the C"
input.contains("Swift")

let languages = ["javascript", "Ruby", "Swift"]
languages.contains("Swift")

input.containsAny(of: languages)
// contains where will call closure
languages.contains(where: input.contains)

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
    
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
}

let testString = "Test string is test"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

let attributedString = NSAttributedString(string: testString, attributes: attributes)

let attribString = NSMutableAttributedString(string: testString)
attribString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attribString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attribString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attribString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attribString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 1))

