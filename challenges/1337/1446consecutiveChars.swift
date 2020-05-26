// Given a string s, the power of the string is the maximum 
// length of a non-empty substring that contains only one unique character.
// Return the power of the string.

class Solution {
    func maxPower(_ s: String) -> Int {
        var maxCount = 0
        var count = 0
        var prev = Character("-")
        for char in s {
            if prev == char {
                count += 1
            } else {
                if count > maxCount {
                    maxCount = count
                }
                count = 1
                prev = char
            }
        }
        return max(maxCount, count)
    }
}