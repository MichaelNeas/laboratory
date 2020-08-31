// Given an array arr of positive integers sorted in a strictly increasing order, and an integer k.
// Find the kth positive integer that is missing from this array.
// Binary search is best case

class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var i = 0
        var arrIndex = 0
        var last = 1
        while i < k {
            if arrIndex < arr.count && arr[arrIndex] == last {
                arrIndex += 1
            } else {
                i += 1
                if i == k {
                    return last
                }
            }
            last += 1
        }
        return 0
    }
}