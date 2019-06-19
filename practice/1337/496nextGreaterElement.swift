///  You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. 
/// Find all the next greater numbers for nums1's elements in the corresponding places of nums2.
/// The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number. 

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return nums1.map { num in
            var nums2Index = 0
            var found = false
            while nums2Index < nums2.count {
                if found == true && nums2[nums2Index] > num {
                    return nums2[nums2Index]
                }
                
                if nums2[nums2Index] == num {
                    found = true
                }
                
                nums2Index += 1
            }                
            return -1
        }
    }
}