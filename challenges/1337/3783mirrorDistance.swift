// You are given an integer n.
// Define its mirror distance as: abs(n - reverse(n))​​​​​​​ where reverse(n) is the integer formed by reversing the digits of n.
// Return an integer denoting the mirror distance of n​​​​​​​.
// abs(x) denotes the absolute value of x.
class Solution {
    func mirrorDistance(_ n: Int) -> Int {
        var num = abs(n)  
        var reversed = 0     
        
        while num > 0 {
            let digit = num % 10     
            reversed = reversed * 10 + digit
            num /= 10  
        }
        return abs(n - reversed)
    }
}
