/// You are given an array of non-zero integers nums. The ant starts reading nums from the first element of it to its end. 
/// At each step, it moves according to the value of the current element:
/// If nums[i] < 0, it moves left by -nums[i] units.
/// If nums[i] > 0, it moves right by nums[i] units.
/// Return the number of times the ant returns to the boundary.

class Solution {
    func returnToBoundaryCount(_ nums: [Int]) -> Int {
        nums.reduce((0,0), { acc, curr in
            let total = acc.0 + curr
            return (total, (acc.1 + (total == 0 ? 1 : 0)))
        }).1
    }
}
