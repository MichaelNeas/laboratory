// For a non-negative integer X, the array-form of X is an array of its digits in left to right order.  
// For example, if X = 1231, then the array form is [1,2,3,1].

// Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.

class Solution {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var j = A.count - 1
        var carry = 0
        var K = K
        var solution = [Int]()

        while K > 0 || j >= 0 {
            var value = (j >= 0 ? A[j] : 0) + 
            (K > 0 ? K % 10 : 0) +
            carry
            
            if value > 9 {
                carry = value / 10
                value = value % 10
            } else {
                carry = 0
            }
            
            solution.append(value)
            
            j -= 1
            if K > 0 {
                K /= 10
            }
        }
        
        if carry > 0 {
            solution.append(carry)
        }
        
        return solution.reversed()
    }
}