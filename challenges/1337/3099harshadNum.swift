/// An integer divisible by the sum of its digits is said to be a Harshad number. 
/// You are given an integer x. Return the sum of the digits of x if x is a Harshad number, otherwise, return -1.


class Solution {
    func sumOfTheDigitsOfHarshadNumber(_ x: Int) -> Int {
        var digSum = 0
        var num = x

        while num > 0 {
            let digit = num % 10
            digSum += digit
            num /= 10
        }

        return x.isMultiple(of: digSum) ? digSum : -1
    }
}
