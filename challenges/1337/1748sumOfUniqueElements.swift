// You are given an integer array nums. The unique elements of an array are the elements that appear exactly once in the array.
// Return the sum of all the unique elements of nums.
class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        nums
        .reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })
        .reduce(0, { $0 + ($1.value == 1 ? $1.key : 0) })
    }
}