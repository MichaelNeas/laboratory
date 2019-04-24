/// Given an integer array with even length, where different numbers in this array represent different kinds of candies. 
/// Each number means one candy of the corresponding kind. You need to distribute these candies equally in number to brother and sister. 
/// Return the maximum number of kinds of candies the sister could gain. 
class Solution {
    func distributeCandies(_ candies: [Int]) -> Int {
        return min(Set(candies).count, candies.count / 2)
    }
}