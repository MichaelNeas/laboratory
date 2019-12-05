/// In a array A of size 2N, there are N+1 unique elements, and exactly one of these elements is repeated N times.
class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        let combindedMap = A.reduce(into: [Int: Int](), { $0[$1] = ($0[$1] ?? 0) + 1 })
        let maxNum = combindedMap.values.max()
        if let maxVal = combindedMap.first(where: {$0.value == maxNum}) {
            return maxVal.key
        }
        return -1
    }
}