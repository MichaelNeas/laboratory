/// You are given a 0-indexed integer array nums, and an integer k.
/// In one operation, you can remove one occurrence of the smallest element of nums.
/// Return the minimum number of operations needed so that all elements of the array are greater than or equal to k.

class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        nums.reduce(0, { acc, curr in
            acc + (curr >= k ? 0 : 1)
        })
    }
}
