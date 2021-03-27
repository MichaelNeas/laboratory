// You are given two strings s1 and s2 of equal length. A string swap is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices.
// Return true if it is possible to make both strings equal by performing at most one string swap on exactly one of the strings. Otherwise, return false.

class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        var swap: (Character, Character)?
        var swapped = false
        var s2Arr = Array(s2)
        
        for (i, val) in s1.enumerated() {
            if val != s2Arr[i] {
                guard !swapped else { return false }
                if let swapa = swap {
                    guard swapa.0 == s2Arr[i] && swapa.1 == val else { return false }
                    swapped = true
                } else {
                    swap = (val, s2Arr[i])
                }
            }
        }
        return swap == nil || swapped
    }
}