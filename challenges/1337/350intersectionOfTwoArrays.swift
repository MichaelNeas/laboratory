// Given two arrays, write a function to compute their intersection.

class Solution {
    // 72%
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1.reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })
        var nums2 = nums2.reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })
        var solution: [Int] = []
        for (key, value) in nums1 {
            if let nums2Value = nums2[key] {
                solution += Array(repeating: key, count: nums2Value >= value ? value : nums2Value)
            }
        }
        return solution
    }

    // 20%
    func intersectSlow(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1.sorted()
        var nums2 = nums2.sorted()
        var solution: [Int] = []
        while nums1.count > 0 && nums2.count > 0 {
            if nums1[0] == nums2[0] {
                solution.append(nums1[0])
                nums1.removeFirst()
                nums2.removeFirst()
            } else if nums1[0] > nums2[0] {
                nums2.removeFirst()
            } else {
                nums1.removeFirst()
            }
        }
        return solution
    }
}