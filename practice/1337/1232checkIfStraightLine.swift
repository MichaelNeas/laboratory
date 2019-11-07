/// You are given an array coordinates, coordinates[i] = [x, y], where [x, y] 
/// represents the coordinate of a point. Check if these points make a straight line in the XY plane.

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count > 1 else { return false }
        var coordinates = coordinates.map{ $0.compactMap { Double($0) } } 
        var slope = slopeF(coordinates[0][1], coordinates[1][1], coordinates[0][0], coordinates[1][0])
        
        for i in 2..<coordinates.count {
            if slope != slopeF(coordinates[i-1][1], coordinates[i][1], coordinates[i-1][0], coordinates[i][0]) {
                return false
            }
        }
        return true
    }
    
    func slopeF(_ y1: Double, _ y2: Double, _ x1: Double, _ x2: Double) -> Double {
        return ((y1 - y2) / (x1 - x2))
    }
}