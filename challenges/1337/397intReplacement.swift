/// Given a positive integer n and you can do operations as follow:
///    If n is even, replace n with n/2.
///    If n is odd, you can replace n with either n + 1 or n - 1.
/// What is the minimum number of replacements needed for n to become 1? 

class Solution {
    func integerReplacement(_ n: Int, _ count: Int = 0) -> Int {
        if n == 1 {
            return count
        }
        if n % 2 == 0 {
            return integerReplacement(n >> 1, count + 1)
        } else { 
            return min(integerReplacement(n - 1, count + 1), integerReplacement(n + 1, count + 1))
        }
    }

    func integerSuperfastReplacement(_ n: Int) -> Int {
        var n = n
        var count = 0
        
        while n != 1 {
            if n & 1 == 0 {
                n >>= 1
            } else if n == 3 || ((n >> 1) & 1) == 0 {
                n -= 1
            } else {
                n += 1
            }
            count += 1
        }
        
        return count
    }
}