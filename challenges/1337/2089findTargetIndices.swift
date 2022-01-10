// You are given a 0-indexed integer array nums and a target element target.
// A target index is an index i such that nums[i] == target.
// Return a list of the target indices of nums after sorting nums in 
// non-decreasing order. If there are no target indices, return an empty list. The returned list must be sorted in increasing order.

class Solution {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        let lowerAndMatches = nums.reduce((0,0), { res, curr in 
            (res.0 + (curr < target ? 1 : 0), res.1 + (curr == target ? 1 : 0))
        })
        
        //return Array(repeating: 0, count: lowerAndMatches.1).enumerated().map { lowerAndMatches.0 + $0.0 }
        
        return (0..<lowerAndMatches.1).reduce(into: [Int](), { $0.append(lowerAndMatches.0 + $1) })
    }
}