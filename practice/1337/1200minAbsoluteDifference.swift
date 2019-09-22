/// Given an array of distinct integers arr, find all pairs of elements with the minimum absolute difference of any two elements. 
/// Return a list of pairs in ascending order(with respect to pairs), each pair [a, b] follows
///    a, b are from arr
///    a < b
///    b - a equals to the minimum absolute difference of any two elements in arr

class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let sortedArr = arr.sorted()
        var sol = [[Int]]()
        var minDiff = Int.max
        for (index, element) in sortedArr.enumerated() {
            guard index < sortedArr.count - 1 else { return sol }
            let diff = abs(sortedArr[index + 1] - element)
            if diff < minDiff {
                sol = [[element, sortedArr[index + 1]]]
                minDiff = diff
            } else if diff == minDiff {
                sol.append([element, sortedArr[index + 1]])
            }
        }
        
        return sol
    }
}