// You are given an array of distinct integers arr and an array of integer arrays pieces, where the integers in pieces are distinct. Your goal is to form arr by concatenating the arrays in pieces in any order. However, you are not allowed to reorder the integers in each array pieces[i].
// Return true if it is possible to form the array arr from pieces. Otherwise, return false.
class Solution {
    func canFormArray(_ arr: [Int], _ pieces: [[Int]]) -> Bool {
        var pieces = pieces
        var i = 0
        while i < arr.count {
            if let foundIndex = pieces.firstIndex(where: { $0.first == arr[i] }) {
                for element in pieces[foundIndex] {
                    if element == arr[i] {
                        i += 1
                    } else {
                        return false
                    }
                }
                pieces.remove(at: foundIndex)
            } else {
                return false
            }
        }
        
        return true
    }
}