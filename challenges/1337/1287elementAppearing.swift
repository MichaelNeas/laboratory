// Given an integer array sorted in non-decreasing order, 
// there is exactly one integer in the array that occurs more than 25% of the time.
// Return that integer.
class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        return arr.reduce(into: [Int:Int](), { acc, curr in
            acc[curr, default: 0] += 1
        }).sorted(by: { $0.value > $1.value })
        .first!.key
    }

    func findSpecialInteger(_ arr: [Int]) -> Int {
        var counter = 0
        var goal = arr.count / 4
        var curr = arr[0]
        for element in arr {
            if element == curr {
                if counter >= goal {
                    return element
                } else {
                    counter += 1
                }
            } else {
                curr = element
                counter = 0
            }
        }
        
        return curr
    }
}

