import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "2019/data/day1.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let fuelFunc = { val in
        return ((val / 3) - 2)
    }
    var cache = [Int:Int]()

    func findFuelSum(fuel: Int) -> Int {
        if let val = cache[fuel] {
            return val
        }
        let fuelProcessed = fuelFunc(fuel)
        if fuelProcessed > 0 {
            let fuelSum = fuelProcessed + findFuelSum(fuel: fuelProcessed)
            cache[fuel] = fuelSum
            return fuelSum
        }
        return 0
    }

    let totalFuel = fileContent.components(separatedBy: .newlines)
        .compactMap { Int($0) }
        .reduce(0, { $0 + findFuelSum(fuel: $1)})
    
    print(totalFuel)
    
}
catch {
    print("Error reading text. \(error)")
}
