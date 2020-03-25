//  The set S originally contains numbers from 1 to n. 
//  But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set, 
//  which results in repetition of one number and loss of another number.
// Given an array nums representing the data status of this set after the error. 
// Your task is to firstly find the number occurs twice and then find the number that is missing. 
// Return them in the form of an array. 

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var map = Set<Int>()
        var duplicate = 0
        var total = (nums.count * (nums.count + 1)) / 2;
        for num in nums {
            if map.contains(num) {
                duplicate = num
            } else {
                map.insert(num)    
                total -= num
            }
        }
        return [duplicate, total]
    }
}