// You are assigned to put some amount of boxes onto one truck. You are given a 2D array boxTypes, where boxTypes[i] = [numberOfBoxesi, numberOfUnitsPerBoxi]:
//     numberOfBoxesi is the number of boxes of type i.
//     numberOfUnitsPerBoxi is the number of units in each box of the type i.
// You are also given an integer truckSize, which is the maximum number of boxes that can be put on the truck. You can choose any boxes to put on the truck as long as the number of boxes does not exceed truckSize.
// Return the maximum total number of units that can be put on the truck.

class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        var sortedTypes = boxTypes.sorted(by: { $0[1] > $1[1] })
        var maxValue = 0
        var size = truckSize
        for boxType in sortedTypes {
            if boxType[0] <= size {
                maxValue += boxType[1] * boxType[0]
                size -= boxType[0]
            } else {
                maxValue += size * boxType[1]
                size = 0
            }
            if size == 0 {
                return maxValue
            }
        }
        
        return maxValue
    }
}