/// Given a list of dominoes, dominoes[i] = [a, b] is equivalent to dominoes[j] = [c, d] 
/// if and only if either (a==c and b==d), or (a==d and b==c) - that is, one domino can be rotated to be equal to another domino.
/// Return the number of pairs (i, j) for which 0 <= i < j < dominoes.length, and dominoes[i] is equivalent to dominoes[j].
class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var dominoMap = [Int: Int]()
        var count = 0
        
        for domino in dominoes {
            let key = domino[0] > domino[1] ? (domino[0]*10)+domino[1] : (domino[1]*10)+domino[0]
            
            if dominoMap[key] != nil {
                let dominoIncrease = dominoMap[key]! + 1
                dominoMap[key] = dominoIncrease
                count += dominoIncrease
            } else {
                dominoMap[key] = 0
            }
        }
        return count
    }
}