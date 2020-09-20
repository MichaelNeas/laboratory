// Given a string s containing only lower case English letters and the '?' character, 
// convert all the '?' characters into lower case letters such that the final string 
// does not contain any consecutive repeating characters. You cannot modify the non '?'  characters.

// It is guaranteed that there are no consecutive repeating characters in the given 
// string except for '?'.

// Return the final string after all the conversions (possibly zero) have been made.
// If there is more than one solution, return any of them. It can be shown that an answer 
// is always possible with the given constraints.

class Solution {
    func modifyString(_ s: String) -> String {
        var solution = ""
        for (i, char) in s.enumerated() {
            if char == "?" {
                guard i != s.count - 1 else { 
                    solution.append(solution.last == "a" ? "b" : "a")
                    continue
                }
				// string offset costs a lot
                if solution.last != "a" && s[s.index(s.startIndex, offsetBy: i+1)] != "a" {
                    solution.append("a")
                } else if solution.last == "a" && s[s.index(s.startIndex, offsetBy: i+1)] != "b" {
                    solution.append("b")
                } else if solution.last != "b" && s[s.index(s.startIndex, offsetBy: i+1)] != "b" {
                    solution.append("b")
                } else {
                    solution.append("c")
                }
            } else {
                solution.append(char)
            }
        }
        return solution
    }
}