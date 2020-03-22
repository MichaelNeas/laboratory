// Given two arrays of integers nums and index. Your task is to create target array under the following rules:
//     Initially target array is empty.
//     From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
//     Repeat the previous step until there are no elements to read in nums and index.
// Return the target array.

class Solution {
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var solution = [Int]()
        for (i, num) in nums.enumerated() {
            solution.insert(num, at: index[i])
        }
        return solution
    }
}