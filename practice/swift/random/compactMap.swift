//Use this method to receive an array of nonoptional values when your transformation produces an optional value.

let scores = ["1", "2", "three", "four", "5"]

let mapped: [Int?] = scores.map { str in Int(str) }
// [1, 2, nil, nil, 5] - Two nil values as "three" and "four" are strings.

let compactMapped: [Int] = scores.compactMap { str in Int(str) }
// [1, 2, 5] - The nil values for "three" and "four" are filtered out.

//Use this method to receive a single-level collection when your transformation produces a sequence or collection for each element.
let scoresByName = ["Henk": [0, 5, 8], "John": [2, 5, 8]]

let mapped = scoresByName.map { $0.value }
// [[0, 5, 8], [2, 5, 8]] - An array of arrays
print(mapped)

let flatMapped = scoresByName.flatMap { $0.value }
// [0, 5, 8, 2, 5, 8] - flattened to only one array

// Used on a sequence and having a transformation returning an optional value, use compactMap. 
// If not, either map or flatMap should give you the results you need