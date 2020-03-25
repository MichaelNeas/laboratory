// In a string S of lowercase letters, these letters form consecutive groups of the same character.
// For example, a string like S = "abbxxxxzyy" has the groups "a", "bb", "xxxx", "z" and "yy".
// Call a group large if it has 3 or more characters.  We would like the starting and ending positions of every large group.
// The final answer should be in lexicographic order.

class Solution {
    func largeGroupPositions(_ S: String) -> [[Int]] {
        var solution = [[Int]]()
        var prev = 0
        let s = Array(S)
        
        for (i, char) in s.enumerated() {
            if char != s[prev] {
                if i - prev >= 3 {
                    solution.append([prev, i-1])
                }
                prev = i
            }
        }
        
        if prev != S.count - 1 && S.count - prev >= 3 {
            solution.append([prev, S.count - 1])
        }
        return solution
    }
}