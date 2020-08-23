/// Given an integer n, add a dot (".") as the thousands separator and return it in string format.

class Solution {
    func thousandSeparator(_ n: Int) -> String {
        guard n != 0 else { return "0" }
        var output = ""
        var number = n
        var i = 0
        while (number > 0) {
            if i % 3 == 0 && i != 0 {
                output.append(".")  
            } 
            output.append(String(number % 10))
            number = number / 10
            i += 1
        }
        return String(output.reversed())
    }
}