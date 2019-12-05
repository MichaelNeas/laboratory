/// You are climbing a stair case. It takes n steps to reach to the top.
/// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

class Solution {
    var cache = [Int: Int]()
    func climbStairs(_ n: Int) -> Int {
        if cache[n] != nil {
            return cache[n]!
        }
        if n <= 1 {
            return 1
        } else {
            cache[n] = climbStairs(n-1) + climbStairs(n-2)
            return cache[n]!
        }
    }
}