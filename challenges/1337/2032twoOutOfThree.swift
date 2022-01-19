// Given three integer arrays nums1, nums2, and nums3, return a distinct array containing all the values that are present in at least two out of the three arrays. You may return the values in any order.

class Solution {
    func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
        let setA = Set(nums1)
        let setB = Set(nums2)
        let setC = Set(nums3)
        let a = setA.intersection(setB)
        let b = setB.intersection(setC)
        let c = setA.intersection(setC)
        return Array(a.union(b).union(c))
    }
}