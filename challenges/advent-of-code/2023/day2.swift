import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day2.txt", relativeTo: currentDirectoryURL)
let maxRed = 12
let maxGreen = 13
let maxBlue = 14

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let gameTotal = fileContent.components(separatedBy: .newlines)
        .compactMap { line in
            let separatedGames = line.components(separatedBy: CharacterSet(charactersIn: ":;"))
            
            var minGreen = 0
            var minBlue = 0
            var minRed = 0
            for gameSet in 1..<separatedGames.count  {
                let draws = separatedGames[gameSet]
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .replacingOccurrences(of: ",", with: "")
                .components(separatedBy: CharacterSet(charactersIn: " "))

                

                for draw in 1..<draws.count {
                    let color = draws[draw]
                    if color.contains("blue") {
                        minBlue = max(Int(draws[draw - 1])!, minBlue)
                    } else if color.contains("red") {
                        minRed = max(Int(draws[draw - 1])!, minRed)
                    } else if color.contains("green") {
                        minGreen = max(Int(draws[draw - 1])!, minGreen)
                    }
                }
            }
            return max(minGreen, 1) * max(minRed, 1) * max(minBlue, 1)
        }
        .reduce(0, +)
    
    print(gameTotal)
    
}
catch {
    print("Error reading text. \(error)")
}
