// You are given a string s of even length. Split this string into two halves of equal lengths, and let a be the first half and b be the second half.
// Two strings are alike if they have the same number of vowels ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'). Notice that s contains uppercase and lowercase letters.
// Return true if a and b are alike. Otherwise, return false.
class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels: Set<String> = Set(["a","e","i","o","u"])
        var count = 0
        let half = (s.count/2)
        for (index, letter) in s.enumerated() {
            if vowels.contains(letter.lowercased()) {
                if index < half {
                    count += 1
                } else {
                    count -= 1
                }
            }
            
        }
        return count == 0
    }
}