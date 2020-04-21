// Given alphanumeric string s. (Alphanumeric string is a string consisting of lowercase English letters and digits).
// You have to find a permutation of the string where no letter is followed by another letter and no digit is 
// followed by another digit. That is, no two adjacent characters have the same type.
// Return the reformatted string or return an empty string if it is impossible to reformat the string.

class Solution {
    func reformat(_ s: String) -> String {
        var solution = ""
        var letterQ = [Character]()
        var numQ = [Character]()
        for char in s {
            if char.isLetter {
                letterQ.append(char)
            } else {
                numQ.append(char)
            }
        }
        
        while !letterQ.isEmpty && !numQ.isEmpty {
            solution.append(String(letterQ.removeFirst()))
            solution.append(String(numQ.removeFirst()))
        }
        
        if !letterQ.isEmpty {
            solution.append(String(letterQ.removeFirst()))
        }
        
        if !numQ.isEmpty, solution.last == nil || solution.last?.isLetter == true {
            solution.append(String(numQ.removeFirst()))
        }
        
        if !numQ.isEmpty, solution.last == nil || solution.first?.isLetter == true {
            solution = String(numQ.removeFirst()) + solution
        }
        
        
        
        return solution.count == s.count ? solution : ""
    }
}