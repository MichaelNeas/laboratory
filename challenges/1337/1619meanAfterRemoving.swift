// Given an integer array arr, return the mean of the remaining integers after removing the smallest 5% and the largest 5% of the elements.
// Answers within 10-5 of the actual answer will be considered accepted.

class Solution {
    func trimMean(_ arr: [Int]) -> Double {
        let count = arr.count, arr = arr.sorted(), threshold = (count*5) / 100
        var sum = 0
        for i in threshold..<(count - threshold) {
            sum += arr[i]
        }
        return Double(sum) / Double (count - (2 * threshold))
    }
}