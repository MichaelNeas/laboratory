import Foundation

func treeFinder(treelines: [[Character]], x: Int, y: Int) -> Int {
	var positionX = 0
	var count = 0
	let length = treelines[0].count

	for positionY in stride(from: 0, to: treelines.count, by: y) {
		if treelines[positionY][positionX % length] == "#" {
			count += 1
		}
		positionX += x
	}
    return count 
}

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day3.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let treelines = fileContent.components(separatedBy: .newlines)
        .compactMap { Array(String($0)) }
    
	print(treeFinder(treelines: treelines, x: 1, y: 1) *
	treeFinder(treelines: treelines, x: 3, y: 1) *
	treeFinder(treelines: treelines, x: 5, y: 1) *
	treeFinder(treelines: treelines, x: 7, y: 1) *
	treeFinder(treelines: treelines, x: 1, y: 2)
	)
}
catch {
    print("Error reading text. \(error)")
}