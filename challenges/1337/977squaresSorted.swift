/// Given an array of integers A sorted in non-decreasing order, 
/// return an array of the squares of each number, also in sorted non-decreasing order.

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        return A.map { $0 * $0 }.sorted()
    }
}