/// Given a fixed length array arr of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.
/// Note that elements beyond the length of the original array are not written.
/// Do the above modifications to the input array in place, do not return anything from your function.

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var index = 0
        while index < arr.count {
            if arr[index] == 0 {
                arr.insert(0, at: index+1)
                arr.removeLast()
                index += 1
            }
            index += 1
        }
    }
}