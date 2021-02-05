// Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
// Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var found = false
        return s.reduce(into: [Character: Int](), { acc, curr in
            acc[curr, default: 0] += 1
        }).values.reduce(0, { sum, value in
            if value % 2 == 1 {
                let sum = sum + (found ? (value - 1) : value)
                found = true
                return sum
            } else {
                return sum + value
            }
        })
    }
}