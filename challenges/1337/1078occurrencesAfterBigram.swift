/// Given words first and second, consider occurrences in some text of the form "first second third", where second comes immediately after first, and third comes immediately after second.
/// For each such occurrence, add "third" to the answer, and return the answer.

class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        var solution: [String] = []
        let splitText = text.components(separatedBy: " ")
        for (index, word) in splitText.enumerated() {
            if word == second, 
            (index - 1) >= 0, 
            splitText[index-1] == first, 
            (index + 1) < splitText.count {
                solution.append(splitText[index + 1])
            }
        }
        
        return solution
    }
}