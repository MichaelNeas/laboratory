/// We are given a list nums of integers representing a list compressed with run-length encoding.
/// Consider each adjacent pair of elements [a, b] = [nums[2*i], nums[2*i+1]] (with i >= 0). 
/// For each such pair, there are a elements with value b in the decompressed list.
/// Return the decompressed list.
class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var sol = [Int]()
        for i in stride(from: 0, to: nums.count, by: 2) {
            sol += Array(repeating: nums[i+1], count: nums[i])
        }
        return sol
    }
}