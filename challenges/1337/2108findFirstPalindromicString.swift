// Given an array of strings words, return the first palindromic string in the array. 
// If there is no such string, return an empty string "".
// A string is palindromic if it reads the same forward and backward.

extension String {
    var isPalindrome: Bool {
        // self == String(self.reversed()) // cheese
        var first: String.Index = startIndex
        var last: String.Index = index(before: endIndex)
        while first < last {
            guard self[first] == self[last] else { return false }
            first = index(after: first)
            last = index(before: last)
        }
        return true
    }
}

class Solution {
    func firstPalindrome(_ words: [String]) -> String {
        words.first(where: { $0.isPalindrome }) ?? ""
    }
}