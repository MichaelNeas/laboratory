/// Given an unsorted array of integers, find the length of longest continuous increasing subsequence (subarray). 

class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var longest = 1
        var count = longest
        var curr = nums[0]
        for num in nums {
            count = curr < num ? count + 1 : 1
            longest = max(longest, count)
            curr = num
        }
        return longest
    }
}