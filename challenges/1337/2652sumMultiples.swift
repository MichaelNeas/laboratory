/// Given a positive integer n, find the sum of all integers in the range [1, n] inclusive that are divisible by 3, 5, or 7.
/// Return an integer denoting the sum of all numbers in the given range satisfying the constraint.

class Solution {
    func sumOfMultiples(_ n: Int) -> Int {
        // not math
        (1...n).reduce(0, { acc, curr in 
            if curr % 3 == 0 || curr % 5 == 0 || curr % 7 == 0 {
                return acc + curr
            } else {
                return acc
            }
        })

        // there's a mathmatical way to solve this problem by looking at 
        // all the numbers divided by 3, 5 & 7, adding those up and removing the overlaps
    }
}