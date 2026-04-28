// You are given a string s and an integer k.
// Reverse the first k characters of s and return the resulting string.

class Solution {
    func reversePrefix(_ s: String, _ k: Int) -> String {
        // String(s.prefix(k)).reversed() + String(s.suffix(s.count-k))
        let second = s.dropFirst(k)
        let first = s.dropLast(s.count - k).reversed()
        return String(first + second)
    }
}