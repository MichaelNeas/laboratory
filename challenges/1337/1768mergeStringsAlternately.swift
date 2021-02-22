// You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. 
// If a string is longer than the other, append the additional letters onto the end of the merged string.
// Return the merged string.

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var solution = String()
        for i in 0..<max(word1.count, word2.count) {
            if i < word1.count {
                solution.append(word1[i])
            }
            
            if i < word2.count {
                solution.append(word2[i])
            }
        }
        return solution
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}