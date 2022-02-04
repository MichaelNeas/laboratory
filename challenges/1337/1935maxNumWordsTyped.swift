// There is a malfunctioning keyboard where some letter keys do not work. All other keys on the keyboard work properly.
// Given a string text of words separated by a single space (no leading or trailing spaces) and a string brokenLetters 
// of all distinct letter keys that are broken, return the number of words in text you can fully type using this keyboard.

class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        text.components(separatedBy: " ").reduce(0, { acc, curr in
            acc + (brokenLetters.first { curr.contains($0) } == nil ? 1 : 0)
        })
    }
}