// There are n people whose IDs go from 0 to n - 1 and each person belongs exactly to one group. 
// Given the array groupSizes of length n telling the group size each person belongs to, 
// return the groups there are and the people's IDs each group includes.
// You can return any solution in any order and the same applies for IDs. 
// Also, it is guaranteed that there exists at least one solution. 

class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var groupDict = [Int: [Int]]()
        for (i, group) in groupSizes.enumerated() {
            if groupDict[group] != nil {
                groupDict[group]!.append(i)
            } else {
                groupDict[group] = [i]
            }
        }
        
        var solution = [[Int]]()
        
        for group in groupDict.keys {
            for offset in stride(from: 0, to: groupDict[group]!.count, by: group) {
                var temp = [Int]()
                for i in 0..<group {
                    temp.append(groupDict[group]![offset+i])
                }
                solution.append(temp)
            }
        }
        
        return solution
    }
}