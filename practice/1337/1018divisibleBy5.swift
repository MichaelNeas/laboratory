/// Given an array A of 0s and 1s, consider N_i: the i-th subarray from A[0] to A[i] interpreted as a binary number (from most-significant-bit to least-significant-bit.)
/// Return a list of booleans answer, where answer[i] is true if and only if N_i is divisible by 5.
class Solution {
    func prefixesDivBy5(_ A: [Int]) -> [Bool]{
        var value = 0
        var sol = A.map { _ in false }
        for i in 0..<A.count {
            value = (value << 1) + A[i]
            sol[i] = (value % 5 == 0)
            //silly overflow
            value = value % 5 
        }
            
        return sol
    }
}