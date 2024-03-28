/// You are given an integer array nums of even length. You have to split the array into two parts nums1 and nums2 such that:
/// 
/// nums1.length == nums2.length == nums.length / 2.
/// nums1 should contain distinct elements.
/// nums2 should also contain distinct elements.
/// Return true if it is possible to split the array, and false otherwise.

class Solution {
    func isPossibleToSplit(_ nums: [Int]) -> Bool {
        // alternate solution is to build up a frequency dictionary and return whether there
        // is a value greater than 2
        var left = Set<Int>()
        var right = Set<Int>()

        for (index, val) in nums.sorted().enumerated() {
            if index % 2 == 0 {
                left.insert(val)
            } else {
                right.insert(val)
            }
        }

        return left.count == right.count && left.count == nums.count / 2
    }
}
