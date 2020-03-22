// Given a string s. You should re-order the string using the following algorithm:

//     Pick the smallest character from s and append it to the result.
//     Pick the smallest character from s which is greater than the last appended character to the result and append it.
//     Repeat step 2 until you cannot pick more characters.
//     Pick the largest character from s and append it to the result.
//     Pick the largest character from s which is smaller than the last appended character to the result and append it.
//     Repeat step 5 until you cannot pick more characters.
//     Repeat the steps from 1 to 6 until you pick all characters from s.

// In each step, If the smallest or the largest character appears more than once you can choose any occurrence and append it to the result.

// Return the result string after sorting s with this algorithm.

class Solution {
    func sortString(_ s: String) -> String {
        var solution = ""
        var sortedS = s.sorted()
        while !sortedS.isEmpty {
            solution.append(sortedS.removeFirst())
            var indexesToRemove = [Int]()
            for (i,char) in sortedS.enumerated() {
                if solution.last! < char {
                    solution.append(char)
                    indexesToRemove.append(i)
                }
            }
            
            for i in indexesToRemove.reversed() {
                sortedS.remove(at: i)
            }
            
            indexesToRemove = []
            
            guard !sortedS.isEmpty else { return solution }
            solution.append(sortedS.removeLast())
            
            for (i, char) in sortedS.reversed().enumerated() {
                if solution.last! > char {
                    solution.append(char)
                    indexesToRemove.append(i)
                }
            }
            
            for i in indexesToRemove.reversed() {
                sortedS.remove(at: sortedS.count - 1 - i)
            }
        }
        
        return solution
    }
}