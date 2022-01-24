// Given two integer arrays arr1 and arr2, and the integer d, return the distance value between the two arrays.
// The distance value is defined as the number of elements arr1[i] such that there is not any element arr2[j] where |arr1[i]-arr2[j]| <= d.

class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        // var count = 0
        // outer: for a in arr1 {
        //     for b in arr2 {
        //         if abs(a-b) <= d {
        //             continue outer
        //         }
        //     }
        //     count += 1
        // }
        // return count
        
        arr1.filter { a in arr2.allSatisfy({ b in abs(a - b) > d }) }.count
        
        // figure out binary search version
    }
}