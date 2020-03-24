// Given a string s. Return all the words vertically in the same order in which they appear in s.
// Words are returned as a list of strings, complete with spaces when is necessary. (Trailing spaces are not allowed).
// Each word would be put on only one column and that in one column there will be only one word.

class Solution {
    func printVertically(_ s: String) -> [String] {
        var solution = [String]()
        let split = s.components(separatedBy: " ")
        for (h, word) in split.enumerated() {
            for (i, char) in word.enumerated() {
                if solution.count > i {
                    solution[i].append("\(char)")
                } else {
                    solution.append(String(repeating: " ", count: h) + "\(char)")
                }
            }
            if word.count < solution.count && (h + 1) < split.count {
                guard let maximum = split[h+1..<split.count].map({$0.count}).max(), maximum > word.count else { continue }
                for i in word.count..<min(maximum, solution.count) {
                    solution[i].append(" ")
                }
            }
        }
        return solution
    }
}