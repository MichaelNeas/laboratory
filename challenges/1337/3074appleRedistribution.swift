/// You are given an array apple of size n and an array capacity of size m.
/// There are n packs where the ith pack contains apple[i] apples. There are m boxes as well, and the ith box has a capacity of capacity[i] apples.
/// Return the minimum number of boxes you need to select to redistribute these n packs of apples into boxes.
/// Note that, apples from the same pack can be distributed into different boxes.

class Solution {
    func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
        var totalApples = apple.reduce(0, +)
        let sortedCaps = capacity.sorted(by: >)
        var count = 0
        for cap in sortedCaps {
            totalApples -= cap
            count += 1 
            if totalApples < 1 {
                return count
            }
        }

        return -1
    }
}
