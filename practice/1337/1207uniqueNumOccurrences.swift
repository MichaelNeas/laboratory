/// Given an array of integers arr, write a function that returns true 
/// if and only if the number of occurrences of each value in the array is unique.

class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        let countMap = arr.reduce(into: [Int:Int](), { (acc, curr) in
            acc[curr, default: 0] += 1            
        })
        return Set(Array(countMap.values)).count == countMap.keys.count
    }
}