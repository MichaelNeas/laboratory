// We define the Perfect Number is a positive integer that is equal to the sum of all its positive divisors except itself.
// Now, given an integer n, write a function that returns true when it is a perfect number and false when it is not. 

class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        guard num > 1 else { return false }
        var sum = 0
        for i in 1..<Int(sqrt(Float(num)))+1 {
            if num % i == 0 {
                if num / i != i && i != 1 {
                    sum += Int(num/i)
                }   
                print(i)
                sum += i
            } 
        }
        return sum == num
    }
}