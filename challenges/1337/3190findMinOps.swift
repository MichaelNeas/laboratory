/// You are given an integer array nums. In one operation, you can add or subtract 1 from any element of nums.
/// Return the minimum number of operations to make all elements of nums divisible by 3.
class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        nums.reduce(0, { $0 + ($1 % 3 == 0 ? 0 : 1) })
    }
}