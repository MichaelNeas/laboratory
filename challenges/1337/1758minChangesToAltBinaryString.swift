// You are given a string s consisting only of the characters '0' and '1'. In one operation, you can change any '0' to '1' or vice versa.
// The string is called alternating if no two adjacent characters are equal. For example, the string "010" is alternating, while the string "0100" is not.
// Return the minimum number of operations needed to make s alternating.

class Solution {
    func minOperations(_ s: String) -> Int {
        let res = s.enumerated().reduce(0, { acc, curr in
            acc + ((curr.0 % 2 == 0 ? curr.1 == "0" : curr.1 == "1") ? 1 : 0)
        })
        return min(res, s.count - res)
    }
}