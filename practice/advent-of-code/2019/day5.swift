import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day5.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let intCodeList = fileContent.components(separatedBy: ",").compactMap { Int($0) }

    var list = intCodeList
    var i = 0

    typealias InstructionMode = (A: Bool, B: Bool, C: Bool, DE: Int)
    
    func mode(value: Int) -> InstructionMode {
        let modeConfig = String(format: "%05d", value)
        // third param
        let A = Int(String(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 0)]))! == 1
        // second param
        let B = Int(String(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 1)]))! == 1
        // first param
        let C = Int(String(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 2)]))! == 1
        // opcode
        let DE = Int(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 3)...])!
        return (A, B, C, DE)
    }

    var currentMode = mode(value: list[i])
    while currentMode.DE != 99 {
        switch currentMode.DE {
        // addition
        case 1: 
            if currentMode.A {
                list[i + 3] = (currentMode.C ? list[i+1] : list[list[i+1]]) + (currentMode.B ? list[i+2] : list[list[i+2]])
            } else {
                list[list[i+3]] = (currentMode.C ? list[i+1] : list[list[i+1]]) + (currentMode.B ? list[i+2] : list[list[i+2]])
            }
            i += 4
        // multiplication
        case 2:
            if currentMode.A {
                list[i + 3] = (currentMode.C ? list[i+1] : list[list[i+1]]) * (currentMode.B ? list[i+2] : list[list[i+2]])
            } else {
                list[list[i+3]] = (currentMode.C ? list[i+1] : list[list[i+1]]) * (currentMode.B ? list[i+2] : list[list[i+2]])
            }
            i += 4
        // store
        case 3:
            print("stored 5")
            list[list[i+1]] = 5
            i += 2
        // output
        case 4:
            print(list[list[i+1]])
            i += 2
        // jump if true
        case 5:
            if (currentMode.C ? list[i+1] : list[list[i+1]]) != 0 {
                i = (currentMode.B ? list[i+2] : list[list[i+2]])
            } else {
                i += 3
            }
        // jump if false
        case 6:
            if (currentMode.C ? list[i+1] : list[list[i+1]]) == 0 {
                i = (currentMode.B ? list[i+2] : list[list[i+2]])
            } else {
                i += 3
            }
        // less than
        case 7:
            if currentMode.A {
                list[i + 3] = ((currentMode.C ? list[i+1] : list[list[i+1]]) < (currentMode.B ? list[i+2] : list[list[i+2]])) ? 1 : 0
            } else {
                list[list[i+3]] = ((currentMode.C ? list[i+1] : list[list[i+1]]) < (currentMode.B ? list[i+2] : list[list[i+2]])) ? 1 : 0
            }
            i += 4
        // equals
        case 8:
            if currentMode.A {
                list[i + 3] = ((currentMode.C ? list[i+1] : list[list[i+1]]) == (currentMode.B ? list[i+2] : list[list[i+2]])) ? 1 : 0
            } else {
                list[list[i+3]] = ((currentMode.C ? list[i+1] : list[list[i+1]]) == (currentMode.B ? list[i+2] : list[list[i+2]])) ? 1 : 0
            }
            i += 4
        default:
            break
        }
        currentMode = mode(value: list[i])
    }
}
catch {
    print("Error reading text. \(error)")
}

