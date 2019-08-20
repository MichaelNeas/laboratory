/// Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 1..<nums.count {
            if nums[i-1] > 0 {
                nums[i] += nums[i-1]
            }
        }   
        return nums.max()!
    }
}