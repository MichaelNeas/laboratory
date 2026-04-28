// You are given an integer array nums.
// The alternating sum of nums is the value obtained by adding elements at even indices and subtracting elements at odd indices. That is, nums[0] - nums[1] + nums[2] - nums[3]...
// Return an integer denoting the alternating sum of nums.

class Solution {
    func alternatingSum(_ nums: [Int]) -> Int {
        nums.enumerated().reduce(0, { acc, curr in 
            if curr.0 % 2 == 0 {
                acc + curr.1
            } else {
                acc - curr.1
            }
        })
    }
}