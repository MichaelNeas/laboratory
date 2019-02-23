/*
Hashable protocol conforms to Equatable, conforming types must also provide an implementation of the equals operator (==). 
The Equatable protocol requires any conforming implementation of == to be an equivalence relation. 
That is, an implementation of == must satisfy the following three conditions, for all values a, b, and c:

    a == a (Reflexivity)
    a == b implies b == a (Symmetry)
    a == b && b == c implies a == c (Transitivity)
*/

/// The example below creates a set called favoriteGenres to store String values:

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items


///    Use the intersection(_:) method to create a new set with only the values common to both sets.
///    Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
///    Use the union(_:) method to create a new set with all of the values in both sets.
///    Use the subtracting(_:) method to create a new set with values not in the specified set.

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


///    Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
///    Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
///    Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
///    Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
///    Use the isDisjoint(with:) method to determine whether two sets have no values in common.

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true


/* 
As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or 
update the value for a particular key. Like the subscript examples above, the updateValue(_:forKey:) 
method sets a value for a key if none exists, or updates the value if that key already exists. 
Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. 
This enables you to check whether or not an update took place.

The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. 
For a dictionary that stores String values, for example, the method returns a value of type String?, or “optional String”.
 This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
*/
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow

/// you can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties:

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow

/// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:

let airportCodes = [String](airports.keys)
// airportCodes is ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames is ["Toronto Pearson", "London Heathrow"]


