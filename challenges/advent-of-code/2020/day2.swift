import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day2.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let passwords = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
    
	var count = 0
    for password in passwords {
		let separated = password.components(separatedBy: " ")
		let range = separated[0].components(separatedBy: "-").compactMap { Int($0) }
		let target = separated[1].first!
		// part 1
		// let instances = separated[2].filter { $0 == target }.count
		// if instances >= range[0] && instances <= range[1] {
		// 	count += 1
		// }
		// part 2 xor
		let instances = Array(separated[2])
		if instances[range[0] - 1] == target && instances[range[1] - 1] != target || 
		instances[range[0] - 1] != target && instances[range[1] - 1] == target {
			count += 1
		}
	}
    
    print(count)
    
}
catch {
    print("Error reading text. \(error)")
}
