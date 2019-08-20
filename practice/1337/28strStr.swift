/// Implement strStr().
/// Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
// Example 1:
// Input: haystack = "hello", needle = "ll"
// Output: 2
// Example 2:
// Input: haystack = "aaaaa", needle = "bba"
// Output: -1
/// Clarification:
/// What should we return when needle is an empty string? This is a great question to ask during an interview.
/// For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hayray = Array(haystack)
        let needles = Array(needle)
        
        guard needles.count > 0 else { return 0 }
        
        for i in 0..<hayray.count {
            if hayray[i] == needles[0] && needles.count <= hayray.count - i {
                needleCheck: for j in 0..<needles.count {
                    if hayray[i+j] != needles[j] {
                        break needleCheck
                    }
                    
                    if j == needles.count - 1 {
                        return i
                    }
                }
            }
        }
        
        return -1
    }
}