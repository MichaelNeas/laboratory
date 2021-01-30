// Given an array nums of 0s and 1s and an integer k, return True if all 1's are at least k places away from each other, otherwise return False.
class Solution {
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        var counter = 0
        for num in nums {
            if num == 1 {
                if counter > 0 && counter <= k {
                    return false
                } else { 
                    counter = 1
                }
            } else {
                if counter != 0 {
                    counter += 1
                }
            }
        }
        return true
    }
}