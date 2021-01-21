// Given a square matrix mat, return the sum of the matrix diagonals.
// Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.

class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var j = 0
        var sum = 0
        
        for i in 0..<mat.count {
            sum += mat[i][j]
            j += 1
        }
        j -= 1
        for i in 0..<mat.count {
            if i != j {
                sum += mat[i][j]
            }
            j -= 1
        }
        return sum
    }
}