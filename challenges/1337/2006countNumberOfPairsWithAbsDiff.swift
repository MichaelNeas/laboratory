/// Given an integer array nums and an integer k, return the number of pairs (i, j) where i < j such that |nums[i] - nums[j]| == k.
/// The value of |x| is defined as:
/// x if x >= 0.
/// -x if x < 0.

class Solution {
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        let seen = nums.reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })
        return nums.map { seen[$0 - k] ?? 0 }.reduce(0, +)
    }
}
