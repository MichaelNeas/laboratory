/// Given an integer n. No-Zero integer is a positive integer which doesn't contain any 0 in its decimal representation.
/// Return a list of two integers [A, B] where:
/// A and B are No-Zero integers.
/// A + B = n
/// It's guarateed that there is at least one valid solution. If there are many valid solutions you can return any of them.
class Solution {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        var counter = 1
        while String(n-counter).contains("0") || String(counter).contains("0") {
            counter += 1
        }
        
        return [counter, n-counter]
    }
}