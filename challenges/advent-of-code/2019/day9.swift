import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day9.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let intCodeList = fileContent.components(separatedBy: ",").compactMap { Int($0) }
        typealias InstructionMode = (A: Mode, B: Mode, C: Mode, DE: Int)
    
    func mode(value: Int) -> InstructionMode {
        let modeConfig = String(format: "%05d", value)
        // third param
        let A = Mode(rawValue: Int(String(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 0)]))!)!
        // second param
        let B = Mode(rawValue: Int(String(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 1)]))!)!
        // first param
        let C = Mode(rawValue: Int(String(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 2)]))!)!
        // opcode
        let DE = Int(modeConfig[modeConfig.index(modeConfig.startIndex, offsetBy: 3)...])!
        return (A, B, C, DE)
    }
    
    enum Mode: Int, CustomStringConvertible {
        case position
        case immediate
        case relative
        
        var description: String {
            switch self {
            case .position: return "Position Mode"
            case .immediate: return "Immediate Mode"
            case .relative: return "Relative Mode"
            }
        }
    }
    
    func execute(tape: [Int]) {
        var list = tape
        var i = 0
        var currentMode = mode(value: list[i])
        var relativeBase = 0
        
        var cParam: Int {
            currentMode.C == .immediate ? list[i+1] : currentMode.C == .position ? list[list[i+1]] : list[list[i+1] + relativeBase]
        }
        
        var bParam: Int {
            currentMode.B == .immediate ? list[i+2] : currentMode.B == .position ? list[list[i+2]] : list[list[i+2] + relativeBase]
        }
        
        var aParam: Int {
            currentMode.A == .immediate ? i+3 : currentMode.A == .position ? list[i+3] : list[i+3] + relativeBase
        }
        
        while currentMode.DE != 99 {
            let tempMax = max(i+3, list[i+3], list[i+3] + relativeBase)
            if tempMax > list.count {
                list += Array(repeating: 0, count: tempMax - list.count)
            }
            
            switch currentMode.DE {
            // addition
            case 1:
                list[aParam] = cParam + bParam
                i += 4
            // multiplication
            case 2:
                list[aParam] = cParam * bParam
                i += 4
            // store
            case 3:
                print(currentMode)
                print("storing")
                list[aParam] = 2
                i += 2
            // output
            case 4:
                print("output: \(cParam)")
                i += 2
            // jump if true
            case 5:
                if cParam != 0 {
                    i = bParam
                } else {
                    i += 3
                }
            // jump if false
            case 6:
                if cParam == 0 {
                    i = bParam
                } else {
                    i += 3
                }
            // less than
            case 7:
                list[aParam] = cParam < bParam ? 1 : 0
                i += 4
            // equals
            case 8:
                list[aParam] = cParam == bParam ? 1 : 0
                i += 4
            // adjust relative base
            case 9:
                relativeBase += cParam
                i += 2
            default:
                print("Woops")
                break
            }
            currentMode = mode(value: list[i])
        }
    }
    
    execute(tape: intCodeList)
    
}
catch {
    print("Error reading text. \(error)")
}

