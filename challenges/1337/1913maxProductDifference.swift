// The product difference between two pairs (a, b) and (c, d) is defined as (a * b) - (c * d).

// For example, the product difference between (5, 6) and (2, 7) is (5 * 6) - (2 * 7) = 16.
// Given an integer array nums, choose four distinct indices w, x, y, and z such that the product difference between pairs (nums[w], nums[x]) and (nums[y], nums[z]) is maximized.

// Return the maximum such product difference.

class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        return sortedNums[nums.count - 1] * sortedNums[nums.count - 2] - sortedNums[0] * sortedNums[1]
        
//         var biggest = 0
//         var secondBiggest = 0
//         var smallest = 10_001
//         var secondSmallest = 10_001
//         for num in nums {
//             if num > biggest && num > secondBiggest {
//                 secondBiggest = biggest
//                 biggest = num
//             } else if num > secondBiggest {
//                 secondBiggest = num
//             }
            
//             if num < smallest && num < secondSmallest {
//                 secondSmallest = smallest
//                 smallest = num
//             } else if num < secondSmallest {
//                 secondSmallest = num
//             }
//         }
        
//         return biggest * secondBiggest - smallest * secondSmallest
    }
}