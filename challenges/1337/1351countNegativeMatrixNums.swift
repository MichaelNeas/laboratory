/// Given a m * n matrix grid which is sorted in non-increasing order both row-wise and column-wise. 
/// Return the number of negative numbers in grid.
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var sol = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] < 0 {
                    sol += grid[0].count - j
                    break
                }
            }
        }
        
        return sol
    }
}