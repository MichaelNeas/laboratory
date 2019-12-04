import Foundation

let input = "372304-847060"
//let usableInput = Array(input).compactMap({ Int(String($0)) }).sorted()
let usableInput = input.split(separator: "-").compactMap({Int($0)})
let maxCount = 6
var count = 0
var foundSolutions = Set<[Int]>()

func isSorted<T: Comparable>(array: Array<T>) -> Bool {
    for i in 1..<array.count {
        if array[i-1] > array[i] {
            return false
        }
    }

    return true
}

for value in usableInput[0]...usableInput[1] {
    var possibility = Array(String(value).compactMap( { Int(String($0)) }))
    var tempSet = Set(possibility)
    var tempDict = possibility.reduce(into: [Int: Int](), {
        $0[$1, default: 0] += 1
    })
    
    if tempSet.count < maxCount, tempDict.values.contains(2), !foundSolutions.contains(possibility), isSorted(array: possibility) {
        foundSolutions.insert(possibility)
        count += 1
    }
}

// fundamental misunderstanding lol
for i in 0..<usableInput.count {
    for j in i+1..<usableInput.count {
        for k in j+1..<usableInput.count {
            for l in k+1..<usableInput.count {
                for m in l+1..<usableInput.count {
                    for n in m+1..<usableInput.count {
                        var tempArr = [usableInput[i], usableInput[j], usableInput[k], usableInput[l], usableInput[m], usableInput[n]]
                        var tempSet = Set(tempArr)
                        if tempSet.count < maxCount, !foundSolutions.contains(tempArr) {
                            print(tempArr)
                            foundSolutions.insert(tempArr)
                            count += 1
                        }
                    }
                }
            }
        }
    }
}

print(count)
print(usableInput)
