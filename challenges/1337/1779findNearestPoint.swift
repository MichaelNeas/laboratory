// You are given two integers, x and y, which represent your current location on a Cartesian grid: (x, y). 
// You are also given an array points where each points[i] = [ai, bi] represents that a point exists at (ai, bi). 
// A point is valid if it shares the same x-coordinate or the same y-coordinate as your location.
// Return the index (0-indexed) of the valid point with the smallest Manhattan distance from your current location. 
// If there are multiple, return the valid point with the smallest index. If there are no valid points, return -1.
// The Manhattan distance between two points (x1, y1) and (x2, y2) is abs(x1 - x2) + abs(y1 - y2).

class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var smallestIndex = -1
        var smallestValue = Int.max
        for (index, point) in points.enumerated() {
            if point[0] == x || point[1] == y {
                let manhattanDistance = abs(x - point[0]) + abs(y - point[1])
                if manhattanDistance < smallestValue {
                    smallestValue = manhattanDistance
                    smallestIndex = index
                }
            }
        }
        
        return smallestIndex
    }
}