// Given a string s, calculate its reverse degree.
// The reverse degree is calculated as follows:
// For each character, multiply its position in the reversed alphabet ('a' = 26, 'b' = 25, ..., 'z' = 1) with its position in the string (1-indexed).
// Sum these products for all characters in the string.
// Return the reverse degree of s.

class Solution {
    func reverseDegree(_ s: String) -> Int {
        var sum = 0
        for (index, char) in s.enumerated() {
            let ascii = Int(char.asciiValue!)
            let oneIndexed = 27 - (ascii - 96)
            sum += (index + 1) * oneIndexed
        }
        return sum
    }
}