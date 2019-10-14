/// Given an arbitrary ransom note string and another string containing letters 
/// from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
/// Each letter in the magazine string can only be used once in your ransom note.
/// You may assume that both strings contain only lowercase letters. 

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var charValueCount = Array(repeating: 0, count: 125)
        for magLetter in magazine.unicodeScalars {
            charValueCount[Int(magLetter.value)] += 1
        }
        for noteLetter in ransomNote.unicodeScalars {
            let charOffset = Int(noteLetter.value)
            if charValueCount[charOffset] == 0 {
                return false
            }
            charValueCount[charOffset] -= 1   
        }
        
        return true
    }
}