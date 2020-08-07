// Given a string s and an integer array indices of the same length.
// The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.
// Return the shuffled string.
class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var solution = Array(repeating: "", count: s.length)
        for (i, char) in s.enumerated() {
            solution[indices[i]] = String(char)
        }
        return solution.joined()
    }
}