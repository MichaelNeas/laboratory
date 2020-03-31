// Given an array of integers arr, a lucky integer is an integer which has a frequency in the array equal to its value.
// Return a lucky integer in the array. If there are multiple lucky integers return the largest of them. 
// If there is no lucky integer return -1.

class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var luckySet = Set<Int>()
        let luckyDict = arr.reduce(into: [Int: Int](), {
            $0[$1, default: 0] += 1
            if $0[$1] == $1 {
                luckySet.insert($1)
            } else if $0[$1]! > $1 {
                luckySet.remove($1)
            }
        })
        
        return luckySet.max() ?? -1
    }
}