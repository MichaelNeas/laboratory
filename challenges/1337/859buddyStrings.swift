// Given two strings A and B of lowercase letters, return true if you can swap two letters in A so the result is equal to B, otherwise, return false.
// Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at A[i] and A[j]. For example, swapping at indices 0 and 2 in "abcd" results in "cbad".
class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else { return false }
        var Aarr = Array(A)
        var Barr = Array(B)
        var mismatch = [(Character, Character)]()
        var countDictionary = [Character: Int]()
        for (index, letter) in Aarr.enumerated() {
            if Barr[index] != letter {
                mismatch.append((letter, Barr[index]))
                if mismatch.count > 2 {
                    return false
                }
            } else {
                countDictionary[letter, default: 0] += 1
            }
        }
        if mismatch.count == 2 && mismatch[0].0 == mismatch[1].1 && mismatch[1].0 == mismatch[0].1 {
            return true
        }
        return countDictionary.values.max() ?? 0 > 1 && mismatch.count != 1
    }
}