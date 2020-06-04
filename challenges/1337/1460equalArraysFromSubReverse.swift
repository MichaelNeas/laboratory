// Given two integer arrays of equal length target and arr.
// In one step, you can select any non-empty sub-array of arr and reverse it. 
// You are allowed to make any number of steps.
// Return True if you can make arr equal to target, or False otherwise.
class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var dict = target.reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })
        for num in arr {
            if let val = dict[num], val - 1 >= 0 {
                dict[num]! -= 1
            } else {
                return false
            }
        }
        return true
    }
}