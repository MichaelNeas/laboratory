import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day5.txt", relativeTo: currentDirectoryURL)

func rangeChecker(num: Int, range: Range<Int>, maps: [String]) -> Int {
    for i in range {
        let row = maps[i].components(separatedBy: " ").compactMap(Int.init)
        // check range contains
        if (row[1]...(row[1] + row[2])).contains(num) {
            // destination + offset
            return row[0] + (num - row[1])
        } 
    }
    return num
}

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    var blocks = fileContent.components(separatedBy: "\n\n")

    let inputs = blocks.removeFirst().components(separatedBy: ":")[1].split(separator: " ").compactMap { Int($0) }

    var seeds: [ClosedRange<Int>] = []

    for i in stride(from: 0, to: inputs.count, by: 2) {
        seeds.append(inputs[i]...(inputs[i] + inputs[i + 1]))
    }

    for block in blocks {
        var ranges: [[Int]] = []
        for line in block.components(separatedBy: "\n").dropFirst() {
            ranges.append(line.split(separator: " ").compactMap { Int($0) })
        }

        var newSeeds: [ClosedRange<Int>] = []

        // go through all the seeds
        while seeds.count > 0 {
            let lastRange = seeds.removeLast()
            var foundOverlap = false

            // go through all the ranges for each mapping
            for range in ranges {
                // start of the current seed range min and the min of the current mapping range
                let overlapStart = max(lastRange.lowerBound, range[1])
                // end of the current seed range max and furthest in the range 
                let overlapEnd = min(lastRange.upperBound, range[1] + range[2])

                if overlapStart < overlapEnd {
                    // new range is the start of the overlap + offset
                    // to the end of the overlap - offset
                    new.append((overlapStart - range[1] + range[0])...(overlapEnd - range[1] + range[0]))
                    if overlapStart > lastRange.lowerBound {
                        // can't put into new because it might mapped, reprocess
                        seeds.append(lastRange.lowerBound...overlapStart)
                    }
                    if lastRange.upperBound > overlapEnd {
                        // can't put into new because it might mapped, reprocess
                        seeds.append(overlapEnd...lastRange.upperBound)
                    }
                    foundOverlap = true
                    break
                }
            }
            if !foundOverlap {
                // 1:1 case
                newSeeds.append(lastRange)
            }
        }
        seeds = newSeeds
    }

    print(seeds.min { $0.lowerBound < $1.lowerBound }!.lowerBound) // 4917124

    // part 1
    // let soils = seeds.map { rangeChecker(num: $0, range: 3..<15, maps: maps) } 
    // let fertilizers = soils.map { rangeChecker(num: $0, range: 17..<38, maps: maps) }
    // let water = fertilizers.map { rangeChecker(num: $0, range: 40..<56, maps: maps) } 
    // let light = water.map { rangeChecker(num: $0, range: 58..<103, maps: maps) }
    // let temp = light.map { rangeChecker(num: $0, range: 105..<152, maps: maps) } 
    // let humidity = temp.map { rangeChecker(num: $0, range: 154..<177, maps: maps) }
    // let location = humidity.map { rangeChecker(num: $0, range: 179..<205, maps: maps) }
    
}
catch {
    print("Error reading text. \(error)")
}
