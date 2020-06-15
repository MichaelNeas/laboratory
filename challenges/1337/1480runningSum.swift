// Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
// Return the running sum of nums.
class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var sum = 0
        return nums.map { sum += $0; return sum }
    }
}