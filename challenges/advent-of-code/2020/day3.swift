import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day3.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let treelines = fileContent.components(separatedBy: .newlines)
        .compactMap { Array(String($0)) }
    
	var positionX = 0
	var count = 0
	let length = treelines[0].count

	for positionY in stride(from: 0, to: treelines.count, by: 1) {
		if treelines[positionY][positionX % length] == "#" {
			count += 1
		}
		positionX += 3
	}
    print(count)    
}
catch {
    print("Error reading text. \(error)")
}