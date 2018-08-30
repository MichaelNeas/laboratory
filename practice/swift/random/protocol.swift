// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html
// A protocol defines a blueprint of methods, properties,
// and other requirements that suit a particular task or piece of functionality.
// The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements.
// Any type that satisfies the requirements of a protocol is said to conform to that protocol.
// Defined requirements for whatever inherits it
// Protocols don’t actually implement any functionality themselves

protocol Protocol1 {
    //Property requirements are always declared as variable properties, prefixed with the var keyword.
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol Protocol2 {
    // property requirements should be static
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    //single sintance property requirement
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let Mike = Person(fullName: "Mike Neas")

protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"


// To modify types for a given instance we use mutating
protocol Togglable {
    mutating func toggle()
}


enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on

// you can specify protocols to require initializers
protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    // required gives explicit satisfication of the protocol
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

// You can use protocols as Types, generator can only be something that inherits from the RandomNumberGenerator protocol
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// Protocol
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

