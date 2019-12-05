/// A boomerang is a set of 3 points that are all distinct and not in a straight line.
/// Given a list of three points in the plane, return whether these points are a boomerang.

class Solution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        // A (2, 4), B (4, 6) and C (6, 8)
        // Slope of AB = (6 – 4)/ (4 – 2) = 1,
        // Slope of BC = (8 – 6)/ (6 – 4) = 1, and
        // Slope of AC = (8 – 4) /(6 – 2) = 1

        // let AB = ((points[1][1] - points[0][1]) / (points[1][0] - points[0][0]))
        // let BC = ((points[2][1] - points[1][1]) / (points[2][0] - points[1][0]))
        // let AC = ((points[2][1] - points[0][1]) / (points[2][0] - points[0][0]))
        // return AB != BC || BC != AC
        
        let A = ((points[1][1] - points[0][1]) * (points[2][0] - points[0][0])) 
        let B = ((points[2][1] - points[0][1]) * (points[1][0] - points[0][0]))
        return A != B
    }
}