/// We are given a matrix with R rows and C columns has cells with integer coordinates (r, c), where 0 <= r < R and 0 <= c < C.
/// Additionally, we are given a cell in that matrix with coordinates (r0, c0).
/// Return the coordinates of all cells in the matrix, sorted by their distance from (r0, c0) from smallest distance to largest distance.  
/// Here, the distance between two cells (r1, c1) and (r2, c2) is the Manhattan distance, |r1 - r2| + |c1 - c2|.  (You may return the answer in any order that satisfies this condition.)

class Solution {
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var solution: [Int:[[Int]]] = [0:[[r0,c0]]]
        
        for i in 0..<R {
            for j in 0..<C{
                let manhattanDistance = (abs(i - r0) + abs(j - c0))
                if solution[manhattanDistance] != nil {
                    solution[manhattanDistance]!.append([i, j])
                } else {
                    solution[manhattanDistance] = [[i, j]]
                }
                
            }
        }
        
        var sol: [[Int]] = [[r0,c0]] 
        let sortedKeys = solution.keys.sorted().forEach { key in
            if key != 0 {
                sol += solution[key]!
            }
        }
        
        return sol
    }
}