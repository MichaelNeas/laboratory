// You are given an integer n.
// Each number from 1 to n is grouped according to the sum of its digits.
// Return the number of groups that have the largest size.

class Solution {
    func countLargestGroup(_ n: Int) -> Int {
        let groups = (1...n).reduce(into: [Int: Int](), { acc, curr in 
            acc[digitSum(curr), default: 0] += 1                           
        })
        
        let max = groups.values.max()!
        
        return groups.filter{ $0.value == max }.count
    }
    
    func digitSum(_ n: Int) -> Int {
        return n == 0 ? 0 : n % 10 + digitSum(n / 10)
    }
}