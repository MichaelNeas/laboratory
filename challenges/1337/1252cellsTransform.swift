// There is an m x n matrix that is initialized to all 0's. There is also a 2D array indices where each indices[i] = [ri, ci] represents a 0-indexed location to perform some increment operations on the matrix.
// For each location indices[i], do both of the following:
// Increment all the cells on row ri.
// Increment all the cells on column ci.
// Given m, n, and indices, return the number of odd-valued cells in the matrix after applying the increment to all locations in indices.

class Solution {
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var matrix = Array(repeating: Array(repeating: false, count: n), count: m)
        for index in indices {
            for i in 0..<m {
                matrix[i][index[1]] = matrix[i][index[1]] ^ true
            }
            
            for i in 0..<n {
                matrix[index[0]][i] = matrix[index[0]][i] ^ true
            }
        }
        
        return matrix.reduce(0, { acc, curr in
            acc + curr.reduce(0, { $0 + ($1 == true ? 1 : 0) })
        })
    }
}

extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}