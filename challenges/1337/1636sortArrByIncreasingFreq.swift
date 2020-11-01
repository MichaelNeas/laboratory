// Given an array of integers nums, sort the array in increasing order 
// based on the frequency of the values. If multiple values have the same frequency, 
// sort them in decreasing order.

// Return the sorted array.

class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        nums.reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })
            .map { ($0, $1) }
            .sorted { $0.0 > $1.0 }
        	.sorted { $0.1 < $1.1 }.flatMap { Array(repeating: $0.0, count: $0.1) }
    }
}