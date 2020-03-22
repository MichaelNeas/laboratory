/// Given an integer n, return a string with n characters such that each character in such string occurs an odd number of times.
/// The returned string must contain only lowercase English letters. If there are multiples valid strings, return any of them.  
class Solution {
    func generateTheString(_ n: Int) -> String {
        var solution = String(repeating: "a", count: n % 2 == 0 ? n - 1 : n)
        if n % 2 == 0 {
            solution.append("b")
        }
        return solution
    }
}