// Given an integer n and an integer array rounds. 
// We have a circular track which consists of n sectors labeled from 1 to n. 
// A marathon will be held on this track, the marathon consists of m rounds. 
// The ith round starts at sector rounds[i - 1] and ends at sector rounds[i]. 
// For example, round 1 starts at sector rounds[0] and ends at sector rounds[1]
// Return an array of the most visited sectors sorted in ascending order.

class Solution {
    func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
        var sectors = Array(repeating: 0, count: n)
        
        var current = rounds[0]
        
        for i in 1..<rounds.count {
            while rounds[i] != current {
                sectors[current-1] += 1
                if current > n-1 {
                    current = 1
                } else {
                    current += 1
                }
            }
        }
        sectors[current-1] += 1
        
        var solution = [Int]()
        var max = 0
        for (i, sector) in sectors.enumerated() {
            if sector == max {
                solution.append(i+1)
            } else if sector > max {
                solution = [i+1]
                max = sector
            }
        }
        
        return solution
    }
}