// You are given a m x n matrix grid consisting of non-negative integers.
// In one operation, you can increment the value of any grid[i][j] by 1.
// Return the minimum number of operations needed to make all columns of grid strictly increasing.

final class Solution {
    func minimumOperations(_ grid: [[Int]]) -> Int {
        var totalOps = 0
        var state = grid
        for col in 1..<state.count {
            for row in 0..<state[col].count {
                guard  state[col-1][row] >= state[col][row] else { continue }
                let ops = state[col-1][row] - state[col][row] + 1
                state[col][row] += ops
                totalOps += ops
            }
        }
        return totalOps
    }
}