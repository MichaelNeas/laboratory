// Given a positive integer n, return the smallest positive integer that is a multiple of both 2 and n.
class Solution {
    func smallestEvenMultiple(_ n: Int) -> Int {
        n % 2 == 0 ? n : n * 2
    }
}