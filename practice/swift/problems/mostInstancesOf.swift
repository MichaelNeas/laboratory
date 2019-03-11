import Foundation
let nums = [1,1,54,23,21,3,123,2,421,4,123,3,24,4,1,2,2423,4324,4,4,43,2,234,4,33,434,2,42,4,5,67,85474,45,546,564,654,45456,4]
let numMap = nums.reduce(into: [Int: Int](), { $0[$1] = ($0[$1] ?? 0) + 1 })
let maxNum = numMap.values.max()
let mostOccuringKeys = numMap.filter {$0.value == maxNum}
print(mostOccuringKeys)