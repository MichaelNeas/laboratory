/// We have a collection of rocks, each rock has a positive integer weight.
/// Each turn, we choose the two heaviest rocks and smash them together.  
/// Suppose the stones have weights x and y with x <= y.  The result of this smash is:
/// If x == y, both stones are totally destroyed;
/// If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.
/// At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedStones = stones.sorted()
        while sortedStones.count > 1 {
            let stone1 = sortedStones.popLast()!
            let stone2 = sortedStones.popLast()!
            var newStone = stone1 - stone2
            if newStone != 0 {
                sortedStones.append(newStone)
            } else if sortedStones.count == 0 {
                return 0
            }
            sortedStones = sortedStones.sorted()
        }
        return sortedStones[0]
    }
}