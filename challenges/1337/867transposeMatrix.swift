// Given a 2D integer array matrix, return the transpose of matrix.
// The transpose of a matrix is the matrix flipped over its main diagonal, switching the matrix's row and column indices.

class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        var sol = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                sol[j][i] = matrix[i][j]
            }
        }
        return sol
    }
}