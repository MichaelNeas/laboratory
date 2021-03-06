# Swift Practice Problems

- [99 Swift Problems](http://www.enekoalonso.com/projects/99-swift-problems/)
- [100 days of coding test](https://www.hackingwithswift.com/review/100/final-exam)

# Notes from reading the docs

- Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
- One of the most important differences between structures and classes is that structures are always copied when they are passed around, but classes are passed by reference.
- Writing <T: Equatable> is the same as writing <T> ... where T: Equatable.
- `print(_:separator:terminator:)`, separator and terminator parameter have default values
- On a 32-bit platform, Int is the same size as Int32. On a 64-bit platform, Int is the same size as Int64.
- Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits. The appropriate floating-point type to use depends on the nature and range of values you need to work with. In situations where either type would be appropriate, Double is preferred.
- Floating-point values are always truncated when used to initialize a new integer value in this way. This means that 4.75 becomes 4, and -3.9 becomes -3.
- Tuples are useful for temporary groups of related values. They’re not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple.
- Swift’s nil isn’t the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil isn’t a pointer—it’s the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.
- You use assertions and preconditions to express the assumptions you make and the expectations you have while coding. 
- Assertions help you find mistakes and incorrect assumptions during development `assertionFailure(_:file:line:)`, and preconditions help you detect issues in production.
- Use a precondition whenever a condition has the potential to be false, but must definitely be true for you to continue execution. `precondition(_:_:file:line:)`
- Unary operators operate on a single target (such as `-a`). Unary prefix operators appear immediately before their target (such as `!b`), and unary postfix operators appear immediately after their target (such as `c!`).
- Binary operators operate on two targets (such as `2 + 3`) and are infix because they appear in between their two targets.
- Ternary operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator `(a ? b : c)`.
- The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil
- If the value of a is non-nil, the value of b is not evaluated. This is known as short-circuit evaluation.
- Readability is always preferred over brevity; use parentheses where they help to make your intentions clear.
- Swift’s String and Character types provide a fast, Unicode-compliant way to work with text.
- Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable.
- Every instance of Swift’s Character type represents a single extended `grapheme cluster`. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.
- using a subscript or a method like prefix(_:)—the result is an instance of Substring, not another string.
- Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent.
- Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations. Swift’s array, set, and dictionary types are implemented as generic collections. For more about generic types and collections, see Generics.
- All collection types are bridged from NS Types
- A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.
- All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, if you want to make your own  hashable type it must also conform to Equatable
- var declared collection types are mutable and let are intended to be immutable
- Unlike a subscript, in dictionaries, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.
- Swift’s Dictionary type does not have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property.
- Swift has five control transfer statements: continue, break, fallthrough, return, throw
- String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool giving super short hand closure comparisons
- Swift may instead capture and store a copy of a value if that value is not mutated by a closure, and if the value is not mutated after the closure is created.
- Closures Are Reference Types
- A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns, escaping requires explicit `self`
- An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function.
- Enumerations with associated values of any given type are known as discriminated unions, tagged unions, or variants in other programming languages.  Associated values are dynamic in nature compared to raw values.
- Raw values can be strings, characters, or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration.
- recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases.
- System.Enum is a reference type, but any specific enum type is a value type.
- isEmpty is faster than count == 0
- Bool.random()
- Final class cannot be inherited from
- Weak references must be unwrapped before use; unowned references can be used directly.
- GCD: QoS - .userInteractive is the highest priority,  .userInitiated execute threads initiated by a user but its not critical, .default is in between here, .utility - long running tasks (processing photos), .background - users aren't aware of and is the least priority (power efficiency)
- By default, closures in Swift are non-escaping. This means that you have to use them right away, and they can’t outlive the scope of the place where they’re called. Think about map or filter: they take the closure that you give them, run it immediately, and discard it.
- And escaping closure is one that lives longer than the function that you originally passed it to. Think of sticking a bunch of closures in an array and storing it somewhere, or storing a callback closure as a property on a view controller.
- Swift requires you to mark stored closures as escaping so that you don’t accidentally do stuff in a closure that you don’t want to outlive its scope. For example, this could include referencing self, which would cause the closure to keep self alive as long as the closure itself is alive. If self stores the closure as a property, that’s a reference cycle. That’s where [weak self] comes in.
- You’ll notice that if you use a property in the closure that you pass to map, it doesn’t force you to explicitly reference self or capture it with [weak self], because it knows that the closure is non-escaping, so it knows it won’t outlive the scope where it’s used.
- This can definitely be confusing, but it might help to think of closures as objects, and the variables referenced inside them as properties.
- CGFloat is different from both Float and Double – it has the ability to change size depending on what device it's running on.
- An NSRange stores both a location and a length. 
- Uppercasing a Character returns a String

## Generics

- Most types have shortcuts for the generics Optional<Int> Int?
- `var set: Set = [2,3,4]`
- Inouts don’t directly reference, they make a copy and reassign under the hood
- Compiler has to be able to infer func generics 
- Extensions in same file can access fileprivate


- @escaping, function will live longer than the function invoked in
- “Stack” is made once ever where in C++ you can see all the mutations of the generics/templates
- Closure vs closure expression
Expression:
```swift
{ (parameters) -> return type in
    statements
}
```