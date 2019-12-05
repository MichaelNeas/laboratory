/// Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
/// Find all the elements of [1, n] inclusive that do not appear in this array.
/// Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

class Solution {
    // O(n) + O(n) + O(n) = O(n)
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var solution = Array(repeating: 0, count: nums.count)
        // O(n)
        for i in 1..<nums.count+1 {
            solution[i-1] = i 
        }
        // O(n)
        for num in nums {
            solution[num-1] = -1
        }
        // O(n) https://developer.apple.com/documentation/swift/array/3017530-removeall
        solution.removeAll { $0 == -1 }
        return solution
    }
}