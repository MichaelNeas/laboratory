// Given an integer n and an integer start.
// Define an array nums where nums[i] = start + 2*i (0-indexed) and n == nums.length.
// Return the bitwise XOR of all elements of nums.

class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var sum = 0
        for i in 0..<n {
            sum = sum ^ (start + (2 * i))
        }
        return sum
    }
}