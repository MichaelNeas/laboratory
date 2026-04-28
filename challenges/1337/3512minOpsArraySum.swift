// You are given an integer array nums and an integer k. You can perform the following operation any number of times:
// Select an index i and replace nums[i] with nums[i] - 1.
// Return the minimum number of operations required to make the sum of the array divisible by k.

class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        nums.reduce(0, +) % k
    }
}