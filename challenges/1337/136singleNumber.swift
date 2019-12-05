/// Given a non-empty array of integers, every element appears twice except for one. Find that single one.
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        let sequence = stride(from: 0, to: sortedNums.count, by: 2)
        for i in sequence {
            if i == sortedNums.count - 1 || sortedNums[i] != sortedNums[i+1] {
                return sortedNums[i]
            }
        }
        return -1
    }

    func singleNumberReduce(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
}