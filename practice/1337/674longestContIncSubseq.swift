/// Given an unsorted array of integers, find the length of longest continuous increasing subsequence (subarray). 

class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var longest = 1
        var count = longest
        var curr = nums[0]
        for num in nums {
            if curr < num {
                count += 1
            } else {
                if count > longest {
                    longest = count
                }
                count = 1
            }
            curr = num
        }
        if count > longest {
            longest = count
        }
        return longest
    }
}