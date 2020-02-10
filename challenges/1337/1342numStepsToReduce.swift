// Given a non-negative integer num, return the number of steps to reduce it to zero. 
// If the current number is even, you have to divide it by 2, otherwise,
// you have to subtract 1 from it.
class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        var num = num
        var sol = 0
        while num != 0 {
            num = num.isMultiple(of: 2) ? num / 2 : num - 1
            sol += 1
        }
        return sol
    }
}