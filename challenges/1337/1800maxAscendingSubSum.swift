// Given an array of positive integers nums, return the maximum possible sum of an ascending subarray in nums.
// A subarray is defined as a contiguous sequence of numbers in an array.
// A subarray [numsl, numsl+1, ..., numsr-1, numsr] is ascending if for all i where l <= i < r, numsi < numsi+1. 
// Note that a subarray of size 1 is ascending.

class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var (high, temp) = (nums[0], nums[0])
        for i in 1..<nums.count {
            if nums[i-1] < nums[i] {
                temp += nums[i]
            } else {
                if temp > high {
                    high = temp
                }
                temp = nums[i]
            }
        }
        return max(high, temp)
    }
}