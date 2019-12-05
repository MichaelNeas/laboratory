/// The Tribonacci sequence Tn is defined as follows: 
/// T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.
/// Given n, return the value of Tn.

class Solution {
    var cache = Array(repeating: 0, count: 38)
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 || n == 2 {
            return 1
        }
        
        if cache[n] > 0 {
            return cache[n]
        } else {
            cache[n] = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3) 
            return cache[n]
        }
    }
}