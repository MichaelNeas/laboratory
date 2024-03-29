/// You are given positive integers n and m.
/// 
/// Define two integers, num1 and num2, as follows:
/// 
/// num1: The sum of all integers in the range [1, n] that are not divisible by m.
/// num2: The sum of all integers in the range [1, n] that are divisible by m.
/// Return the integer num1 - num2.


class Solution {
    func differenceOfSums(_ n: Int, _ m: Int) -> Int {
        (1..<n+1).reduce(0, { acc, curr in
            acc + (curr % m == 0 ? -curr : curr)
        })
    }
}
