// Given a binary string s ​​​​​without leading zeros, return true​​​ if s contains at most one contiguous segment of ones. Otherwise, return false.
class Solution {
    func checkOnesSegment(_ s: String) -> Bool {
        // check if there is ever a 0 then a 1 and we can guarentee there is
        // at least 2 segments of 1's
        !s.contains("01")
    }
}