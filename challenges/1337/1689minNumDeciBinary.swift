// A decimal number is called deci-binary if each of its digits is either 0 or 1 without any leading zeros. For example, 101 and 1100 are deci-binary, while 112 and 3001 are not.
// Given a string n that represents a positive decimal integer, return the minimum number of positive deci-binary numbers needed so that they sum up to n.

class Solution {
    // 8 4 5 2 0
    // 1 1 1 1 0
    // 1 1 1 1 0
    // 1 1 1 0 0 
    // 1 1 1 0 0
    // 1 0 1 0 0
    // 1 0 0 0 0
    // 1 0 0 0 0
    // 1 0 0 0 0
    func minPartitions(_ n: String) -> Int {
        Int(String(n.max()!))!
    }
}