// A sentence is a list of words that are separated by a single space with no leading or trailing spaces.
// You are given an array of strings sentences, where each sentences[i] represents a single sentence.
// Return the maximum number of words that appear in a single sentence.

class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        sentences.reduce(0, { acc, curr in
            let words = curr.filter({ $0 == " "}).count + 1
            return acc < words ? words : acc
        })
    }
}