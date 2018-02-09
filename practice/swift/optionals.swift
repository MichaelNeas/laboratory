//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

//value or no value
// An optional is a kind of container.
// An optional String is a container which might contain a String
var name: String? = "Mike"
var age: Int? = nil
var town: String = "Saybrook" // No "?" after String
//A String and an optional String are completely different types.

print(name ?? "Empty")
print(age ?? "Empty Age")
print(town)

// optional is just an enum with either .none or .some
enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}

var dog: String? = "Fen" // Create an optional String that contains "Fen"
//var peter: Person? = Person() // An optional "Person" (custom type)

// A class with a String and an optional String property
// class Car {
// 	var modelName: String // must exist
// 	var internalName: String? // may or may not exist
// }


let numberToFind: Int = 21
let numberFromString: Int? = Int("21") // Optional(21)
if numberToFind == numberFromString {
    print("Matching") 
}

// How Swift actually compares to nil
var pants: String? = nil
let temp: Optional<String> = Optional.none
if pants == temp { // equivalent to if tuxedoRequired == nil
    print("pants is nil")
}