/// Given a m * n matrix mat of ones (representing soldiers) and zeros (representing civilians), 
/// return the indexes of the k weakest rows in the matrix ordered from the weakest to the strongest.
/// A row i is weaker than row j, if the number of soldiers in row i is less than the number of 
/// soldiers in row j, or they have the same number of soldiers but i is less than j. 
/// Soldiers are always stand in the frontier of a row, that is, always ones may appear first and then zeros.
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var sol = [(Int, Int)]()
        for (i, s) in mat.enumerated() {
            var j = 0
            while j < s.count && s[j] == 1 {
                j+=1
            }
            sol.append((i, j))
        }
        return sol.sorted(by: {$0.1 < $1.1}).prefix(k).map{ $0.0 }
    }
}