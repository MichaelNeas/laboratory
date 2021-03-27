// Given an alphanumeric string s, return the second largest numerical digit that appears in s, or -1 if it does not exist.
// An alphanumeric string is a string consisting of lowercase English letters and digits.
class Solution {
    func secondHighest(_ s: String) -> Int {
        let m = Set(s.compactMap { $0.wholeNumberValue }).sorted(by: >)
        return m.count > 1 ? m[1] : -1
    }
}