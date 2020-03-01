/// Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. 
/// That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
/// Return the answer in an array.
class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var store = Array(repeating: 0, count: 101)
        for num in nums {
            store[num] += 1
        }
                
        var total = 0
        var smallerCount = Array(repeating: 0, count: 101) 
        for i in 1...100 {
            total += store[i-1]
            smallerCount[i] = total
        }
        
        return nums.map{ smallerCount[$0] }
    }
}