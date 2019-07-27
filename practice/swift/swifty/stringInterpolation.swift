import Foundation

extension String.StringInterpolation {
	mutating func appendInterpolation(_ template: String = "%@", ifPresent value: String?) {
		guard let value = value else { return }
		let suffix = String(format: template, value)
		self.appendInterpolation(" " + suffix)
	}
}

let name = "Aspirin"
let potency = "Regular Strength"
let unit = "325 mg"
let route: String? = nil//"the mouth"

let text = "\(name): \(potency) \(unit) \("via %@", ifPresent: route)"
print("|\(text)|")
