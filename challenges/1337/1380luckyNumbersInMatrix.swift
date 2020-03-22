/// Given a m * n matrix of distinct numbers, return all lucky numbers in the matrix in any order.
/// A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.

class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        var minDict = [Int: Int]()
        for row in 0..<matrix.count {
            let minValIndex = matrix[row].firstIndex(of: matrix[row].min()!)!
            if minDict[minValIndex] != nil {
                if minDict[minValIndex]! < matrix[row][minValIndex] {
                    minDict[minValIndex] = matrix[row][minValIndex]
                }
            } else {
                minDict[minValIndex] = matrix[row][minValIndex]
            }
             
        }
        var luckList = [Int]()
        for key in minDict.keys {
            var colList = [Int]()
            for col in matrix {
                colList.append(col[key])
            }
            if colList.max() == minDict[key]! {
                luckList.append(minDict[key]!)
            }
        }
        return luckList
    }
}