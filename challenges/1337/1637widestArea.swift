// Given n points on a 2D plane where points[i] = [xi, yi], Return the widest vertical area between two points such that no points are inside the area.
// A vertical area is an area of fixed-width extending infinitely along the y-axis (i.e., infinite height). The widest vertical area is the one with the maximum width.
// Note that points on the edge of a vertical area are not considered included in the area.

class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let sortedPoints = points.map { $0[0] }.sorted()
        return sortedPoints.reduce((0, sortedPoints[0]), { acc, curr in 
            (max(acc.0, abs(curr - acc.1)), curr)                                          
        }).0
    }
}