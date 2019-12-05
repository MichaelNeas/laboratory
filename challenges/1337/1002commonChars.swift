/// Given an array A of strings made only from lowercase letters, 
/// return a list of all characters that show up in all strings within the list (including duplicates).  
/// For example, if a character occurs 3 times in all strings but not 4 times, you need to include that 
/// character three times in the final answer.
/// You may return the answer in any order.

class Solution {
    func commonChars(_ A: [String]) -> [String] {
        var solution: [Character] = Array(A[0])
        var temp: [Character] = []
        for wordIndex in 1..<A.count {
            temp = []
            for character in A[wordIndex]{
                if let firstMatchingChar = solution.firstIndex(of: character) {
                    temp.append(solution.remove(at: firstMatchingChar))
                }
            }
            solution = temp
        }
        return solution.map { String($0) }
    }
}