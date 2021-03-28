// You are given a string word that consists of digits and lowercase English letters.
// You will replace every non-digit character with a space. For example, "a123bc34d8ef34" will become " 123  34 8  34". Notice that you are left with some integers that are separated by at least one space: "123", "34", "8", and "34".
// Return the number of different integers after performing the replacement operations on word.
// Two integers are considered different if their decimal representations without any leading zeros are different.

class Solution {
    func numDifferentIntegers(_ word: String) -> Int {
        var temp = ""
        var found = Set<String>()
        let digitSet = CharacterSet.decimalDigits
        
        for val in word.unicodeScalars {
            if digitSet.contains(val) {
                temp.append(String(val))
            } else {
                if !temp.isEmpty {
                    found.insert(trim(value: temp))
                    temp = ""
                }
            }
        }
        if !temp.isEmpty {
            found.insert(trim(value: temp))
        }
        return found.count 
    }
    
    func trim(value: String) -> String {
        value.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
    }
}