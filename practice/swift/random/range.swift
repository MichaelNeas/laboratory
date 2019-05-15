/// The closed range operator (a...b) defines a range that runs from a to b,
/// and includes the values a and b. The value of a must not be greater than b.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

/// The half-open range operator (a..<b) defines a range that runs from a to b, but doesn’t include b.

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

/// The closed range operator has an alternative form for ranges that continue as far as possible in one direction—for example, 
/// a range that includes all the elements of an array from index 2 to the end of the array.

for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

for name in names[..<2] {
    print(name)
}
// Anna
// Alex


let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true


// fizz buzz range and ismultiple api
Array(0..<100).forEach { num in
    var str = ""
    str += num.isMultiple(of: 3) ? "Fizz" : "Foo"
    str += num.isMultiple(of: 5) ? "Buzz" : "Bar"
    print(str)
}
