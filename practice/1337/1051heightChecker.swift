/// Students are asked to stand in non-decreasing order of heights for an annual photo.
/// Return the minimum number of students not standing in the right positions.  
/// (This is the number of students that must move in order for all students to be standing in non-decreasing order of height.)

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var sortedHeights = heights.sorted()
        return sortedHeights.enumerated().reduce(0, { (accumulator, current) in
            return accumulator + (heights[current.0] != current.1 ? 1 : 0)
        })
    }
}