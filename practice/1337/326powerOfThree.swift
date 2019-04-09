/// Given an integer, write a function to determine if it is a power of three.

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 1 {
            return true
        }
        var three = 3
        while three <= n {
            if three == n {
                return true
            } else {
                three *= 3
            }
        }
        return false
    }

    func isPowerOfThreeSilly(_ n: Int) -> Bool {
        return ( n>0 &&  1162261467%n==0)
    }
}