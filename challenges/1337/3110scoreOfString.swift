/// You are given a string s. 
/// The score of a string is defined as the sum of the absolute difference between the ASCII values of adjacent characters.
/// Return the score of s.

class Solution {
    func scoreOfString(_ s: String) -> Int {
        let sArr = Array(s)
        var score = 0
        for i in 1..<sArr.count {
            score += abs(Int(sArr[i].asciiValue!) - Int(sArr[i - 1].asciiValue!))
        }
        return score

        // s.utf8CString          // TIL
		//  .dropLast()           // TIL
		//  .compactMap(Int.init) 
		//  .adjacentPairs()      //TIL
		//  .map{abs($0-$1)}      
		//  .reduce(0,+)  
    }
}