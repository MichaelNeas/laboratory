//: Playground - noun: a place where people can play

let triple = """
I have a full length feature film coming out soon
and i want it to take as many
"lines" as possible.
"""

var anArray = [String]()
var aDictionary = [String: Float]()

anArray.append("mike")
aDictionary["string"] = 12

let optionalMe: String? = nil
let defaultMe: String = "Not Mike"
print(optionalMe == nil)

var greet = "Hi"
if let me = optionalMe {
    //wont execute because doesnt pass if requirements
    greet = "Hey \(me ?? defaultMe)"
}
let othergreet = "Hey \(optionalMe ?? defaultMe)"
print(othergreet)
print(greet)

let vegetable = "red celery pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let a = [1,2,3,4]
for b in a {
    print(b)
}

let b = [
    "Bill":[12,32],
    "Jon":[23,41,512],
    "jonbill":[5,4,3,2,1,0]
]
var largest: Int = 0
for (name, favoriteNumbers) in b {
    for eachNumber in favoriteNumbers {
        if eachNumber > largest {
            largest = eachNumber
        }
    }
}
print(largest)

var total = 0
for i in 0..<5 {
    print(i)
}

for i in 0...5 {
    print(i)
}

//Both of these functions return immutable values
//They can be rearranged but not manipulated
func whosThis(pokemon: String,is color: String) -> String {
    return "\(pokemon) is \(color)"
}

func whosThis(pokemon: String,is color: String, _ type: String) -> String {
    return "\(pokemon) is \(color) and is \(type)"
}
//strings have sweet internal functions
whosThis(pokemon: "Pikachu", is: "Yellow").lowercased().sorted()
whosThis(pokemon: "Pikachu", is: "Yellow", "electric").uppercased()

//tuple returned
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//I LOVE FIRST CLASS FUNCTIONS!!!!!!!!
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
var increment8 = makeIncrementer()(increment(7))

//this is absolutely wonderful syntax
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// in is to show where the signature is separated from the body
numbers.map({ (number: Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number * 2
})
let conciseCB = numbers.map({ number in number * 2})
print(conciseCB)
let moreCONCISE = numbers.map { $0 * 2 }
print(moreCONCISE)

class Dog {
    var numberOfLegs = 4
    var name: String

    init() {
        self.name = "DOGE"
    }
    
    init(name: String) {
        self.name = name
    }

    func toString() -> String {
        return "A Dog named \(name) with \(numberOfLegs) legs"
    }
}

class Puppy: Dog {
    private var size: String

    override init(name: String) {
        size = "Unknown"
        super.init(name: name)
    }
    //public accessors for private variables
    var weight: String {
        get{
            return size
        }
        set{
            if newValue == "bleh" {
                size = "tubby puppy"
            } else {
                size = "normal doge"
            }
        }
    }
}

let pup = Dog(name: "Chai")
let pup2 = Dog()
pup.toString()
pup2.toString()
let realPup = Puppy(name: "Chris")
realPup.weight = "bleh"
//print(realPup.size)
print(realPup.weight)
let optionalPup: Puppy? = Puppy(name: "Spot")
let optionalSize = optionalPup?.weight
print(optionalSize)

//wow this is crazy
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let king = Rank.king
let kingRawValue = king.rawValue
print(kingRawValue)
//“in cases where there isn’t a meaningful raw value, you don’t have to provide one.”
if let convertedRank = Rank(rawValue: 3){
    let tresDesc = convertedRank.simpleDescription()
    print(tresDesc)
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
print(hearts.color())


enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch failure {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}

//Structures are always copied when passed around, classes are references
struct Player{
    var number: Int
    var suit: Suit
    var rank: Rank

    func toString() -> String {
        return "Player \(number) has a \(rank.simpleDescription()) that is \(suit.color())"
    }
}

let pokerPlayer = Player(number: 1, suit: .hearts, rank: .nine)
print(pokerPlayer.toString())


// Integer literals
/* 
Integer literals can be written as:

    A decimal number, with no prefix
    A binary number, with a 0b prefix
    An octal number, with a 0o prefix
    A hexadecimal number, with a 0x prefix
*/

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation


/// For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:

    // 1.25e2 means 1.25 x 102, or 125.0.
    // 1.25e-2 means 1.25 x 10-2, or 0.0125.

/// For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp:

    // 0xFp2 means 15 x 22, or 60.0.
    // 0xFp-2 means 15 x 2-2, or 3.75.

/// All of these floating-point literals have a decimal value of 12.1875:

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

/// Numeric literals can contain extra formatting to make them easier to read. 
/// Both integers and floats can be padded with extra zeros and can contain 
/// underscores to help with readability. Neither type of formatting affects the underlying value of the literal:

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1 // tf

// can now use AudioSample as a UInt16
typealias AudioSample = UInt16
