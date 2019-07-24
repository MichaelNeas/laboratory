
// Name - operators, symbols
// Arity and position - number of arguments or operands that the function takes
// precentence - order of operations, cannot change of standard operators
// Associativity - left to right, right to left, cannot change of standard operators
// https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations
// swift short circuit evaluations happen by passing operators a closure that operate only when it needs to
// @autoclosure () -> Bool is an example of how to do this, 1 line closures don't need return function
// static func &&(lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool

// infix is classic x + y, prefix is scheme + A B, postfix A B +
infix operator +/-: RangeFormationPrecedence

@inlinable func +/-<T: FloatingPoint>(lhs: T, rhs: T) -> ClosedRange<T> {
    let pos = abs(rhs)
    return ClosedRange(uncheckedBounds: (lower: lhs-pos, upper: lhs+pos))
}

let around5 = 5.0 +/- 0.5
around5.contains(5.3)
around5.contains(5.6)
around5.contains(5.5)
around5.contains(4.49)
around5.contains(4.5)
