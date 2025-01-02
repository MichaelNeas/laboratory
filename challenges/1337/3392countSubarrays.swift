/// Given an integer array nums, return the number of subarrays of length 3 
/// such that the sum of the first and third numbers equals exactly half of the second number.

class Solution {
    func countSubarrays(_ nums: [Int]) -> Int {
        (2..<nums.count).reduce(0, { acc, curr in
            acc + ((2 * (nums[curr] + nums[curr - 2]) == nums[curr - 1]) ? 1 : 0)
        })
    }
}