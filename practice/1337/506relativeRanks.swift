///  Given scores of N athletes, find their relative ranks and the people with the top three highest scores, 
/// who will be awarded medals: "Gold Medal", "Silver Medal" and "Bronze Medal".

class Solution {
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        var solution = Array(repeating: "0", count: nums.count)
        var nums = nums
            .enumerated()
            .map { ($0, $1) }
            .sorted(by: {$0.1 > $1.1})
        
        for (index, val) in nums.enumerated() {
            switch index {
                case 0:
                    solution[val.0] = "Gold Medal"
                case 1: 
                    solution[val.0] = "Silver Medal"
                case 2:
                    solution[val.0] = "Bronze Medal"
                default:
                    solution[val.0] = String(index + 1)
            }
        }
        
        return solution
    }                              
}