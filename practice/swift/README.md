# Swift Practice Problems

- [99 Swift Problems](http://www.enekoalonso.com/projects/99-swift-problems/)

# Just swift things

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