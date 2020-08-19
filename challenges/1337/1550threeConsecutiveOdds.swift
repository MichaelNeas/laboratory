// Given an integer array arr, return true 
// if there are three consecutive odd numbers in the array. 
// Otherwise, return false. 
class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        guard arr.count >= 3 else { return false }
        for i in 0..<arr.count-2 {
            if (arr[i] % 2 == 1) && (arr[i+1] % 2 == 1) && (arr[i+2] % 2 == 1)  {
                return true
            }
        }
        return false
    }
}