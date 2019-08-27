protocol Inflatable {
	mutating func refillAir()
}
// in swift we can extend protocols to provide default implementations
extension Inflatable {
	mutating func refillAir() {
		print("Refilling the air.")
	}
}
// Using try? converts a function's return value into an optional. 

// This code will result in a constant set to nil
struct Password {
	var text: String
	init?(input: String) {
		if input.count < 6 {
			print("Password too short.")
			return nil
		}
		text = input
	}
}
let password = Password(input: "hell0")

// default dictionary values
let planets = [1: "Mercury", 2: "Venus"]
let venus = planets[2, default: "Planet X"]

// valid
Bool("false")
Double("2.3")