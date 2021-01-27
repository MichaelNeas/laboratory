// You are given an array rectangles where rectangles[i] = [li, wi] represents the ith rectangle of length li and width wi.
// You can cut the ith rectangle to form a square with a side length of k if both k <= li and k <= wi. For example, if you have a rectangle [4,6], you can cut it to get a square with a side length of at most 4.
// Let maxLen be the side length of the largest square you can obtain from any of the given rectangles.
// Return the number of rectangles that can make a square with a side length of maxLen.

class Solution {
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        var largestSize = 0
        var count = 0
        for rect in rectangles {
            let smallest = min(rect[0], rect[1])
            if smallest == largestSize {
                count += 1
            } else if smallest > largestSize {
                count = 1
                largestSize = smallest
            }
        }
        
        return count
    }
}