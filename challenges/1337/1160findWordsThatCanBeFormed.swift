// You are given an array of strings words and a string chars.
// A string is good if it can be formed by characters from chars (each character can only be used once).
// Return the sum of lengths of all good strings in words.

class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        let charMap = chars.reduce(into: [Character:Int](), { res, curr in
            res[curr, default: 0] += 1
        })
        
        return words.reduce( 0, { res, curr in
            var processingCharMap = charMap
            for (offset, element) in curr.enumerated() {
                if processingCharMap[element] != nil,
                    processingCharMap[element]! > 0 {
                    processingCharMap[element]! -= 1
                } else {
                    return res
                }
            }
            return res + curr.count
        })
    }
}