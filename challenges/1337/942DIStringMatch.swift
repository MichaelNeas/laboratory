/// Given a string S that only contains "I" (increase) or "D" (decrease), let N = S.length.
/// Return any permutation A of [0, 1, ..., N] such that for all i = 0, ..., N-1:
/// If S[i] == "I", then A[i] < A[i+1]
/// If S[i] == "D", then A[i] > A[i+1]

class Solution {
    func diStringMatch(_ S: String) -> [Int] {
        var min = 0
        var max = S.count
        var solution: [Int] = []
        
        for char in S {
            if char == "I" {
                solution.append(min)
                min += 1
            }else {
                solution.append(max)
                max -= 1
            }
            
        }
        solution.append(max)
        return solution
    }
}