// You are given a 2D integer array matrix of size n x n representing the adjacency matrix of an undirected graph with n vertices labeled from 0 to n - 1.

class Solution {
    func findDegrees(_ matrix: [[Int]]) -> [Int] {
        matrix.map { $0.reduce(0, { $0 + $1 })}
    }
}