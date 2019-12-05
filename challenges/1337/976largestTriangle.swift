/// Given an array A of positive lengths, return the largest perimeter of a triangle with non-zero area, formed from 3 of these lengths.
/// If it is impossible to form any triangle of non-zero area, return 0.

class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        let sortedLengths = A.sorted()
        var i = sortedLengths.count - 1
        while i > 1 {
            if sortedLengths[i] < sortedLengths[i - 1] + sortedLengths[i - 2] {
                return sortedLengths[i] + sortedLengths[i - 1] + sortedLengths[i - 2]
            }
            i -= 1   
        }
        return 0
    }
}