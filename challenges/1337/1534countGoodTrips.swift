// Given an array of integers arr, and three integers a, b and c. You need to find the number of good triplets.
// A triplet (arr[i], arr[j], arr[k]) is good if the following conditions are true:
//     0 <= i < j < k < arr.length
//     |arr[i] - arr[j]| <= a
//     |arr[j] - arr[k]| <= b
//     |arr[i] - arr[k]| <= c
// Where |x| denotes the absolute value of x.
// Return the number of good triplets.

class Solution {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        var count = 0
        for i in 0..<arr.count {
            for j in i+1..<arr.count {
                for k in j+1..<arr.count {
                    if abs(arr[i] - arr[j]) <= a && abs(arr[j] - arr[k]) <= b && abs(arr[i] - arr[k]) <= c {
                        count += 1
                    }
                }
            }
            
        }
        
        return count
    }
}