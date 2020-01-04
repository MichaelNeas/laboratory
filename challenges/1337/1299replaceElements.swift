/// Given an array arr, replace every element in that array with the 
/// greatest element among the elements to its right, and replace the last element with -1.
/// After doing so, return the array.
class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var rev = Array(arr.reversed())
        var greatest = rev[0]
        rev[0] = -1
        
        for i in 1..<rev.count {
            if rev[i] > greatest {
                let temp = rev[i]
                rev[i] = greatest
                greatest = temp
            } else {
                rev[i] = greatest
            }
        }
        
        
        return rev.reversed()
    }
}