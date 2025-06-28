/// You are given an integer array nums. Transform nums by performing the following operations in the exact order specified:
/// Replace each even number with 0.
/// Replace each odd numbers with 1.
/// Sort the modified array in non-decreasing order.
/// Return the resulting array after performing these operations.

class Solution {
    func transformArray(_ nums: [Int]) -> [Int] {
        // var zeros = [Int]()
        // var ones = [Int]()
        var sol = [Int]()
        for num in nums {
            if num % 2 == 0 {
                sol.insert(0, at: 0)
                // zeros.append(0)
            } else {
                sol.append(1)
                // ones.append(1)
            }
        }
        return sol
        // return zeros + ones
    }
}