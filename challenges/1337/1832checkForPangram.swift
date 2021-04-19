// A pangram is a sentence where every letter of the English alphabet appears at least once.
// Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.

class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        sentence.reduce(into: Set(), { $0.insert($1) }).count >= 26
    }
}