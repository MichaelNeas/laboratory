// Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var solution = ""
        var num1 = String(num1.reversed())
        var num2 = String(num2.reversed())
        var limit = max(num1.count, num2.count)
        var i = 0
        var carry = 0
        while limit > i || carry != 0 {
            var tempSum = carry
            carry = 0
            if num1.count > 0 {
                tempSum += Int(String(num1.remove(at: num1.startIndex)))!
            }
            
            if num2.count > 0 {
                tempSum += Int(String(num2.remove(at: num2.startIndex)))!
            }
            
            carry = tempSum > 9 ? 1 : 0
            solution = String(tempSum % 10) + solution
            i += 1
        }
        
        
        return solution
    }
}