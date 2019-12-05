/// Your function should return true if any value appears at least 
/// twice in the array, and it should return false if every element is distinct.

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numSet = Set<Int>()
        
        for num in nums {
            if numSet.contains(num) {
                return true
            } else {
                numSet.insert(num)
            }
        }
        
        return false
    }

    // 100
    func containsDuplicateCount(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}