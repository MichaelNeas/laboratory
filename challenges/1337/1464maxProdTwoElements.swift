/// Given the array of integers nums, you will choose two different indices i and j of that array. 
/// Return the maximum value of (nums[i]-1)*(nums[j]-1). 

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var max = (Int.min, Int.min)
        for num in nums {
            if num > max.0 {
                if max.0 > max.1 {
                    max.1 = max.0
                }
                max.0 = num
            } else if num > max.1 {
                max.1 = num
            }
        }
        return (max.1 - 1) * (max.0 - 1)
    }
}