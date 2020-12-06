import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day6.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let answers = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
	var count = 0
	var activeSet = Set<Character>()
	var first = true

	for answer in answers {
		if answer == "" {
			print(activeSet)
			count += activeSet.count
			activeSet.removeAll()
			first = true
		} else {
			if first {
				activeSet.formUnion(Array(answer))
				first = false
			} else {
				activeSet.formIntersection(Array(answer))
			}
		}
	}
	print(count)
} catch {
	print("ERROR")
}