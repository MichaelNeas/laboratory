// You are given a string allowed consisting of distinct characters and an array of strings words. A string is consistent if all characters in the string appear in the string allowed.
// Return the number of consistent strings in the array words.
class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let allowed = Set(allowed)
        return words.reduce(0, { acc, curr in 
            for character in curr {
                if !allowed.contains(character) {
                    return acc
                }
            }
            return acc + 1
        })
    }
}