/// You are given an integer array nums and an integer k. 
/// You want to find a subsequence of nums of length k that has the largest sum.
/// Return any such subsequence as an integer array of length k.
/// A subsequence is an array that can be derived from another array by deleting some or no elements without 
// changing the order of the remaining elements.

class Solution {
    func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
        guard k <= nums.count else { return nums }
        
        // maintain sub array solution
        // var subArr = nums[0..<k]
        // .enumerated()
        // .map{ ($1, $0)}
        // .sorted(by: { $0.0 < $1.0 })

        // for i in k..<nums.count {
        //     if nums[i] > subArr[0].0 {
        //         subArr.append((nums[i], i))
        //         subArr.removeFirst()
        //         subArr.sort(by: { $0.0 < $1.0 })
        //     }
        // }

        // return subArr.sorted(by: { $0.1 < $1.1 }).map { $0.0 }

        // sort all, subarray, sort on index out
        let maxWithIndex = nums.enumerated()
            .map { ($0,$1)}
            .sorted(by: { $0.1 < $1.1})

        return maxWithIndex[nums.count - k..<nums.count]
            .sorted(by: { $0.0 < $1.0 })
            .map { $0.1 }


        // alternatively could build a PQ datastructure
    }
}