// You are given a 0-indexed integer array nums of size n.
// Define two arrays leftSum and rightSum where:
// leftSum[i] is the sum of elements to the left of the index i in the array nums. If there is no such element, leftSum[i] = 0.
// rightSum[i] is the sum of elements to the right of the index i in the array nums. If there is no such element, rightSum[i] = 0.
// Return an integer array answer of size n where answer[i] = |leftSum[i] - rightSum[i]|.

class Solution {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        var pointer = 0
        var rightSum = nums.reduce(0, +)
        var leftSum = 0
        var sol = [Int]()
        var hidden = -1

        while pointer<nums.count {
            hidden = nums[pointer]
            rightSum -= hidden
            if pointer - 1 >= 0 {
                leftSum += nums[pointer - 1]
            }
            sol.append(abs(leftSum - rightSum))
            pointer += 1
        }

        return sol
    }
}