/// You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.
/// Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, 
/// and there is exactly one island (i.e., one or more connected land cells).
/// The island doesn't have "lakes" (water inside that isn't connected to the water around the island). 
/// One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. 
/// Determine the perimeter of the island.

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var sum = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    sum += checkNeighbors(i, j, grid)   
                }
            }
        }
        return sum
    }
    
    func checkNeighbors(_ x: Int, _ y: Int, _ grid: [[Int]]) -> Int{
        var sum = 0
        sum += y + 1 < grid[0].count ? grid[x][y + 1] == 1 ? 0 : 1 : 1
        sum += y - 1 >= 0  ? grid[x][y - 1] == 1 ? 0 : 1 : 1
        sum += x + 1 < grid.count ? grid[x + 1][y] == 1 ? 0 : 1 : 1
        sum += x - 1 >= 0 ? grid[x - 1][y] == 1 ? 0 : 1 : 1
        return sum
    }
}