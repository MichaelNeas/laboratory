// Given two integer arrays startTime and endTime and given an integer queryTime.
// The ith student started doing their homework at the time startTime[i] and finished it at time endTime[i].
// Return the number of students doing their homework at time queryTime. More formally, 
// return the number of students where queryTime lays in the interval [startTime[i], endTime[i]] inclusive.

class Solution {
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        var total = 0
        for i in 0..<startTime.count {
            if (startTime[i]...endTime[i]).contains(queryTime) {
                total += 1
            }
        }
        return total
    }
}