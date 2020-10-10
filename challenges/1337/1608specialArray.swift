// You are given an array nums of non-negative integers. nums is considered special if there exists a number x such that 
// there are exactly x numbers in nums that are greater than or equal to x.
// Notice that x does not have to be an element in nums.
// Return x if the array is special, otherwise, return -1. It can be proven that if nums is special, the value for x is unique.

class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        var x = 0
        var sortedNums = nums.sorted()
        
        whileBoi: while !sortedNums.isEmpty {
            var count = 0
            var badCount = 0
            
            for i in 0..<sortedNums.count {
                if x <= sortedNums[i] {
                    count += 1
                    if count > x {
                        count = 0
                        sortedNums.removeFirst(badCount)
                        badCount = 0
                        if let nextInLine = sortedNums.first {
                            x += 1
                        } else {
                            return -1
                        }
                        continue whileBoi
                    }
                } else {
                    badCount += 1
                }
            }
            return x == count ? x : -1
        }
        return -1
    }
}