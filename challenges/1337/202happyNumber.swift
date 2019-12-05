/// A happy number is a number defined by the following process: Starting with any positive integer, 
/// replace the number by the sum of the squares of its digits, and repeat the process until the number 
/// equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. 
/// Those numbers for which this process ends in 1 are happy numbers.

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var previousCache = Set<Int>()
        var val = n
        
        while true {
            if val == 1 { return true } 
            if previousCache.contains(val) { return false }
            previousCache.insert(val)
            val = computeSquaredSum(val)
        }
    }
    
    func computeSquaredSum(_ n: Int) -> Int {
        var temp = n
        var arrayOfDigits: [Int] = []
        while temp != 0 {
            arrayOfDigits.append(temp%10)
            temp /= 10
        }
        return arrayOfDigits.map{$0*$0}.reduce(0,+)
    }
}