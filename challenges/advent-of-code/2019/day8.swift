import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day8.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let intList = Array(fileContent).compactMap { Int(String($0)) }
    let layerSize = 25*6
    let layerCount = intList.count / layerSize

    var layers: [[Int]] = []

    var i = 0
    var layerIndex = 0
    for _ in 0..<layerCount{
        layers.append([])
        repeat {
            layers[layerIndex].append(intList[i])
            i += 1
        }
        while i % layerSize != 0 
        layerIndex += 1 
    }

    var count = 0
    var minIndex = -1
    var minCount = 10000

    for (index, layer) in layers.enumerated() {
        count = 0
        for code in layer {
            if code == 0 {
                count += 1
            }
        }
        if count < minCount {
            minIndex = index
            minCount = count
        }
    }

    var oneTwoCount = [Int: Int]()
    for code in layers[minIndex] {
        oneTwoCount[code, default: 0] += 1 
    }
    print(oneTwoCount[1]! * oneTwoCount[2]!)


    i = 0
    layerIndex = 0
    var image = [Int]()

    for j in 0..<layerSize {
        var layerValue = 2
        while layerValue > 1 && layerIndex < layers.count {
            layerValue = layers[layerIndex][j]
            layerIndex += 1
        }
        layerIndex = 0
        image.append(layerValue)
    } 
    
    let result = image.compactMap{String($0)}.joined(separator: "")
    for (index, res) in result.enumerated() {
        print(res == "1" ? "*" : " ", terminator:"")
        if (index+1) % 25 == 0 {
            print("")
        }
    }
}
catch {
    print("Error reading text. \(error)")
}