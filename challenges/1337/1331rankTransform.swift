/// Given an array of integers arr, replace each element with its rank.
/// The rank represents how large the element is. The rank has the following rules:
///     Rank is an integer starting from 1.
///     The larger the element, the larger the rank. If two elements are equal, their rank must be the same.
///     Rank should be as small as possible.

class Solution {
    // O(nlogn) + O(n) + O(n) => O(nlogn + n)
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var start = 1
        let dict = arr.sorted().reduce(into: [Int: Int](), {
            if $0[$1] == nil {
                $0[$1] = start
                start += 1
            }
        })
        
        return arr.map { dict[$0]! }
    }
}