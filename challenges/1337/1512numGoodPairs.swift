// Given an array of integers nums.
// A pair (i,j) is called good if nums[i] == nums[j] and i < j.
// Return the number of good pairs.

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var output = 0
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    output += 1
                }
            }
        }
        return output
    }
}