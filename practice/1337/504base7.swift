/// Given an integer, return its base 7 string representation.

class Solution {
    func convertToBase7(_ num: Int) -> String {
        guard num != 0 else { return "0" }
        var num = num
        var result = ""
        var isNegative = num < 0
        while num != 0 {
            result = "\(abs(num % 7))" + result
            num = num / 7
        }
        return "\(isNegative ? "-" + result : result)"
    }
}