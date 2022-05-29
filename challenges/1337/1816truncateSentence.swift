// A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each of the words consists of only uppercase and lowercase English letters (no punctuation).
// For example, "Hello World", "HELLO", and "hello world hello world" are all sentences.
// You are given a sentence s​​​​​​ and an integer k​​​​​​. You want to truncate s​​​​​​ such that it contains only the first k​​​​​​ words. Return s​​​​​​ after truncating it.
class Solution {
    func truncateSentence(_ s: String, _ k: Int) -> String {
        s.split(separator: " ")[0..<k].joined(separator: " ")
        // s.components(separatedBy: " ")[0..<k].joined(separator: " ")
    }
}