/// ++X and X++ increments the value of the variable X by 1.
/// --X and X-- decrements the value of the variable X by 1.
/// Initially, the value of X is 0

class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        operations.reduce(into: 0, { $0 += ($1 == "++X" || $1 == "X++") ? 1 : -1 })   
    }
}
