import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day4.txt", relativeTo: currentDirectoryURL)

do {
    let fileContent = try String(contentsOf: dataURL, encoding: .utf8)
    let passports = fileContent.components(separatedBy: .newlines)
        .compactMap { String($0) }
	var data = [[String:String]]()
	var curr = [String:String]()
	let eyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
	enum requiredKeys: String, CaseIterable {
		case byr
		case iyr
		case eyr
		case hgt
		case hcl
		case ecl
		case pid
	}
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
		for reqKey in requiredKeys.allCases {
			if passport[reqKey.rawValue] == nil {
				continue data
			} 
			switch reqKey {
				case .byr:
					if passport[reqKey.rawValue]!.count != 4 {
						continue data
					}
					if let val = Int(passport[reqKey.rawValue]!) {
						if val < 1920 || val > 2002 {
							continue data
						}
					}
				case .iyr:
					if passport[reqKey.rawValue]!.count != 4 {
						continue data
					}
					if let val = Int(passport[reqKey.rawValue]!) {
						if val < 2010 || val > 2020 {
							continue data
						}
					}
				case .eyr:
					if passport[reqKey.rawValue]!.count != 4 {
						continue data
					}
					if let val = Int(passport[reqKey.rawValue]!) {
						if val < 2020 || val > 2030 {
							continue data
						}
					}
				case .hgt:
					if let val = Int(passport[reqKey.rawValue]!) {
						if (val < 150 || val > 195) || (val < 59 || val > 76) {
							continue data
						}
					}
					let range = NSRange(location: 0, length: passport[reqKey.rawValue]!.utf16.count)
					let regex = try! NSRegularExpression(pattern: "[0-9]*cm")
					if regex.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range) == nil {
						let regexIn = try! NSRegularExpression(pattern: "[0-9]*in")
						if regexIn.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range) == nil {
							continue data
						} 
					}
				case .hcl:
					let range = NSRange(location: 0, length: passport[reqKey.rawValue]!.utf16.count)
					let regex = try! NSRegularExpression(pattern: "#([0-9]|[a-f]){6}")
					if regex.firstMatch(in: passport[reqKey.rawValue]!, options: [], range: range) != nil {
						if passport[reqKey.rawValue]!.count != 7 {
							continue data
						}
					} else {
						continue data
					}
				case .ecl:
					if !eyeColors.contains(passport[reqKey.rawValue]!) {
						continue data
					}
				case .pid:
					if passport[reqKey.rawValue]!.count != 9 {
						continue data
					}
			}
		}
		count += 1
	}
	print(count)
}
catch {
    print("Error reading text. \(error)")
}
