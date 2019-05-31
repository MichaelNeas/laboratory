/// Given an array A of non-negative integers, half of the integers in A are odd, and half of the integers are even.
/// Sort the array so that whenever A[i] is odd, i is odd; and whenever A[i] is even, i is even.
/// You may return any answer array that satisfies this condition.

class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var evens: [Int] = []
        var odds: [Int] = []
        A.forEach { element in
            if element % 2 == 0 {
                evens.append(element)
            } else {
                odds.append(element)
            }  
        }
        var sol: [Int] = []
        
        for index in 0..<evens.count {
            sol.append(evens[index])
            sol.append(odds[index])
        }
        
        return sol
    }
}