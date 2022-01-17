// Given a string s, return true if s is a good string, or false otherwise.
// A string s is good if all the characters that appear in s have the same number of occurrences (i.e., the same frequency).

class Solution {
    func areOccurrencesEqual(_ s: String) -> Bool {
        let frequencies = s.reduce(into: [Character:Int](), { acc, curr in
            acc[curr, default: 0] += 1                             
        })
        
        guard let first = frequencies.first?.value else { return true }
        for (_, val) in frequencies {
            if val != first {
                return false
            }
        }
        return true
    }
}