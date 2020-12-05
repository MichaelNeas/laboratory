import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day4.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let passports = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
	var data = [[String:String]]()
	var curr = [String:String]()
	let requiredKeys = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	for passportLine in passports {
		if passportLine.isEmpty {
			data.append(curr)
			curr = [String:String]()
			continue
		}
		let components = passportLine.components(separatedBy: " ")
		for component in components {
			let keyValue = component.components(separatedBy: ":")
			curr[keyValue[0]] = keyValue[1]
		}
	}
	data.append(curr)

	var count = 0
	data: for passport in data {
		for reqKey in requiredKeys {
			if passport[reqKey] == nil {
				continue data
			}
		}
		count += 1
	}
	print(count)
}
catch {
    print("Error reading text. \(error)")
}
