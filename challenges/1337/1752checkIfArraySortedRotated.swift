// Given an array nums, return true if the array was originally sorted in non-decreasing order, then rotated some number of positions (including zero). Otherwise, return false.
// There may be duplicates in the original array.
// Note: An array A rotated by x positions results in an array B of the same length such that A[i] == B[(i+x) % A.length], where % is the modulo operation.

class Solution {
    // saw a cool solution with counting
    func check(_ nums: [Int]) -> Bool {
        guard let leftMin = nums.first else { return true }
        var absoluteMin = -1
        for i in 1..<nums.count {
            let num = nums[i]
            // make sure current is greater than or equal to the previous
            // also be sure that it's greater than or equal to the absolute min
            if num >= nums[num - 1] && absoluteMin <= num {
                if absoluteMin != -1 {
                    if leftMin >= num {
                        continue
                    } else {
                        return false
                    }
                }
            } else {
                // we might have an inflection point (original min)
                if absoluteMin == -1 { 
                    absoluteMin = num
                } else {
                    return false
                }
            }
        }
        
        return true
        
    }
}