import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day6.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let answers = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
	var count = 0
	var activeSet = Set<Character>()
	for answer in answers {
		if answer == "" {
			count += activeSet.count
			activeSet.removeAll()
		} else {
			activeSet.formUnion(Array(answer))
		}
	}
	print(count)
} catch {
	print("ERROR")
}