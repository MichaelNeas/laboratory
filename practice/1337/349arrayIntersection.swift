/// Given two arrays, write a function to compute their intersection.
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // 10% return Array(Set(nums1.filter { nums2.contains($0) }))
        // 20% return Array(Set(nums1).intersection(Set(nums2)))
        // 98.6%
        let numSet1 = Set(nums1)
        let numSet2 = Set(nums2)
        var sol:[Int] = []
        for num in numSet1 {
            if numSet2.contains(num) {
                sol.append(num)
            }
        }
        return sol
    }
}