/// Given an integer n, return any array containing n unique integers such that they add up to 0.
class Solution {
    func sumZero(_ n: Int) -> [Int] {
        var sol = [Int]()
        if n % 2 != 0 {
            sol.append(0)
        }
        var i = 1
        while i < n {
            sol.append(i)
            sol.append(-i)
            i += 2
        }
        
        return sol
    }
}