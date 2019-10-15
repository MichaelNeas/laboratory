/// Balanced strings are those who have equal quantity of 'L' and 'R' characters.
/// Given a balanced string s split it in the maximum amount of balanced strings.
/// Return the maximum amount of splitted balanced strings.
class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var accumulator = 0
        var currentState = 0
        for leftOrRight in s {
            currentState += leftOrRight == "L" ? 1 : -1
            if currentState == 0 {
                accumulator += 1
            }
        }
        return accumulator
    }
}