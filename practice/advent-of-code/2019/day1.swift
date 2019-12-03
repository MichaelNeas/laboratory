import Foundation

let location = "/Users/michaelneas/workspace/laboratory/practice/advent-of-code/2019/data/day1.txt"

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let fuelFunc = { val in
        return ((val / 3) - 2)
    }
    let totalFuel = fileContent.components(separatedBy: .newlines)
        .compactMap { Int($0) }
        .reduce(0, { sum, curr in
            var sum = sum
            var temp = fuelFunc(curr)
            while temp > 0 {
                sum += temp
                temp = fuelFunc(temp)
            }
            return sum
        })
    print(totalFuel)
    
}
catch {
    print("Error reading text. \(error)")
}
