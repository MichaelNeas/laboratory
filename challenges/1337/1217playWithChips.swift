/// There are some chips, and the i-th chip is at position chips[i].
/// You can perform any of the two following types of moves any number of times (possibly zero) on any chip:
/// Move the i-th chip by 2 units to the left or to the right with a cost of 0.
/// Move the i-th chip by 1 unit to the left or to the right with a cost of 1.
/// There can be two or more chips at the same position initially.
/// Return the minimum cost needed to move all the chips to the same position (any position).

class Solution {
    func minCostToMoveChips(_ chips: [Int]) -> Int {
        var odd = 0
        var even = 0
        for chip in chips {
            if chip % 2 != 0 {
                odd += 1
            } else { 
                even += 1
            }
        }
    
        return min(odd, even);
    }
}