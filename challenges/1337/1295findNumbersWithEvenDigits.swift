/// Given an array nums of integers, return how many of them contain an even number of digits. 
class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.compactMap{ String($0).compactMap{ $0.wholeNumberValue }.count }.filter { $0 % 2 == 0 }.count
    }
    
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.reduce(0, {  $0 + (String($1).count % 2 == 0 ? 1 : 0) })
    }
}