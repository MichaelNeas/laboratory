/// You are given a 0-indexed array of strings words and a character x.
/// Return an array of indices representing the words that contain the character x.
/// Note that the returned array may be in any order.

class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        // words.indices.filter { words[$0].contains(x) }    
        words
        .enumerated()
        .map { ($0, $1)}
        .filter { $0.1.contains(x) }
        .map { $0.0 }
    }
}