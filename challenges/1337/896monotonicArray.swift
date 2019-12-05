/// An array is monotonic if it is either monotone increasing or monotone decreasing.
/// An array A is monotone increasing if for all i <= j, A[i] <= A[j].  
/// An array A is monotone decreasing if for all i <= j, A[i] >= A[j].
/// Return true if and only if the given array A is monotonic.

class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        if A.count == 1 {
            return true
        }
        var prev = 0
        for aIndex in 1..<A.count {
            if A[prev] <= A[aIndex]{
                prev = aIndex
            }else{
                break
            }
        }
        if (A.count-1) == prev {
            return true
        }
        prev = 0
        for aIndex in 1..<A.count {
            if A[prev] >= A[aIndex]{
                prev = aIndex
            }else{
                break
            }
        }
        if A.count-1 == prev {
            return true
        }
        return false
    }

    func isSlowerMonotonic(_ A: [Int]) -> Bool {
        var inc = true
        var dec = true
        for index in 1..<A.count {
            inc = (A[index - 1] <= A[index]) && inc
            dec = (A[index - 1] >= A[index]) && dec
        }
            
        return inc || dec;
    }
}