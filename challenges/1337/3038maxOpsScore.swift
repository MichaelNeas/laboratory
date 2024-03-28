/// Given an array of integers called nums, you can perform the following operation while nums contains at least 2 elements:
/// 
/// Choose the first two elements of nums and delete them.
/// The score of the operation is the sum of the deleted elements.
/// 
/// Your task is to find the maximum number of operations that can be performed, such that all operations have the same score.
/// 
/// Return the maximum number of operations possible that satisfy the condition mentioned above.


class Solution {
    func maxOperations(_ nums: [Int]) -> Int {
        let score = nums[0] + nums[1]
        var count = 1
        for index in stride(from: 3, to: nums.count, by: 2) {
            if nums[index] + nums[index-1] == score {
                count += 1
            } else {
                return count
            }
        }

        return count
    }
}
