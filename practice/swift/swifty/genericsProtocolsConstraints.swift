// Generics are referred to as Parameteric Polymorphism

/// ExpressibleByArrayLiteral is a great way to be able to assign without requiring explicit Generics
//extension TypeToInitWithAnArray: ExpressibleByArrayLiteral {
//    init(arrayLiteral elements: Element...) {
//
//    }
//}
// var thing: TypeToInitWithAnArray = [1,2,3] // gives us a type with Int Generic from the array!

// generic constraints
//func add<T>(_ a: T, _ b: T) -> T where T: Numeric {
// witness table allows us to move the where and pass to generic
// this will be slower but you can hint to the compiler to make inline specializations to make it quicker
@inlinable func add<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

add(2,3)

// SystemRandomNumberGenerator is crypto secure default
// associated types can also have constraints
protocol Bank {
    // add coonstraints that can also be extensible
    associatedtype Value: Numeric
}

struct Pair<Card> {
    var first: Card
    var second: Card
}

extension Pair {
    var flipped: Pair {
        return Pair(first: second, second: first)
    }
}

// as long as the underlying elements are equatable the compiler can check the relationship
// protocol conformance
extension Pair: Equatable where Card: Equatable {
    
}

/// conditional conformance in action
extension Pair: Comparable where Card: Comparable {
    static func <(lhs: Pair<Card>, rhs: Pair<Card>) -> Bool {
        return lhs.first < rhs.second
    }
}

protocol Orderable {
    associatedtype Card
    func min() -> Card
    func max() -> Card
    func sorted() -> Self
}

extension Pair: Orderable where Card : Comparable {
    func min() -> Card {
        return first < second ? first : second
    }
    
    func max() -> Card {
        return first > second ? first : second
    }
    
    func sorted() -> Pair<Card> {
        return first < second ? self : flipped
    }
}

let suits = Pair(first: "K", second: "Q")
let nums = Pair(first: 10, second: 7)

nums.sorted()
nums.max()

suits.first

/// bools won't work and the compiler lifts that weight for us
//let bools = Pair(first: true, second: false)
//bools.first()
