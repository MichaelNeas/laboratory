import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day2.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let intCodeList = fileContent.components(separatedBy: ",").compactMap { Int($0) }

    func findNounVerb(list: [Int]) -> Int {
        var list = list
        var i = 0
        while list[i] != 99 {
            switch list[i] {
            case 1:
                list[list[i+3]] = list[list[i+1]] + list[list[i+2]]
            case 2:
                list[list[i+3]] = list[list[i+1]] * list[list[i+2]]
            default:
                break
            }
            i += 4
        }
        return list[0]
    }
    
    for noun in 0..<100{
        for verb in 0..<100{
            var copy = intCodeList
            copy[1] = noun
            copy[2] = verb
            if findNounVerb(list: copy) == 19690720 {
                print(100 * noun + verb)
                break
            }
        }
    }
}
catch {
    print("Error reading text. \(error)")
}

