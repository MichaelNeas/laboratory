// Given an array of string words. Return all strings in words which is substring of another word in any order. 
// String words[i] is substring of words[j], if can be obtained removing some characters to left and/or right side of words[j].

class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var solution = [String]()
        out: for i in 0..<words.count {
            for j in 0..<words.count {
                if words[j].contains(words[i]) && words[i] != words[j] {
                    solution.append(words[i])
                    continue out
                }
            }
        }
        return solution
    }
}