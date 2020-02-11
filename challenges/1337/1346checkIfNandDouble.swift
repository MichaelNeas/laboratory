/// Given an array arr of integers, check if there exists two integers N and M such that N is the double of M ( i.e. N = 2 * M).
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var seen = [Int:Bool]()
        for num in arr {
            if seen[num<<1] != nil || (num % 2 == 0 && seen[num>>1] != nil) {
                return true
            }
            seen[num] = true
        }
        return false
    }
}