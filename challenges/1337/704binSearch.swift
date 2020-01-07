/// Given a sorted (in ascending order) integer array nums of n elements 
/// and a target value, write a function to search target in nums. 
/// If target exists, then return its index, otherwise return -1.
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var hi = nums.count - 1
        var lo = 0
        
        while lo <= hi {
            let temp = lo + ((hi - lo) / 2)
            if nums[temp] == target {
                return temp
            } else if nums[temp] < target {
                lo = temp + 1
            } else {
                hi = temp - 1
            }
        }
        
        return -1
    }
}