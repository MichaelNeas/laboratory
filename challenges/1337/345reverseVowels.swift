/// Write a function that takes a string as input and reverse only the vowels of a string.
class Solution {
    let vowels = Set<Character>(["a","e","i","o","u", "A", "E", "I", "O", "U"])
    
    func reverseVowels(_ s: String) -> String {
        var allVowels = s.filter { vowels.contains($0) }
        var sol = ""
        for single in s {
            sol += String(vowels.contains(single) ? allVowels.removeLast() : single) 
        }
        return sol
    }
}