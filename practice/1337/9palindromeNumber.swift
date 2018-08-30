//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        //return String(x) == String(String(x).reversed())
         var num = x
         var rev = 0
         while (num > 0) {
              var dig = num % 10
              rev = rev * 10 + dig
              num = num / 10
         }
        return rev == x
    }
}

//best
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x<0 {return false}
        var temp = x
        var result = 0
        while temp > 0 {
            result = result * 10 + temp % 10
            temp = (temp - temp % 10) / 10
        }
        if result == x {
            return true
        
        }else {
            return false
        }
    }
}

// 3 liner
func isPalindrome(_ x: Int) -> Bool {
        
    var string = String(x)
    let revertString = String(string.reversed())
            
    return string == revertString

}