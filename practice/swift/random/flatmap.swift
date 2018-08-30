var arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]

// first iterating the array of arrays
arrayOfArrays.map { array in

    // and second iterating 
    // the current array
    return array.map { integer in
        // multiplying its content by 2
        return integer * 2
    }
} 

var multipliedByTwo = arrayOfArrays.map { array in
    return array.map { integer in
        return integer * 2
    }
}

var flattened = Array(multipliedByTwo.joined())
print(flattened) // outputs: [ 2, 2, 4, 4, 6, 6 ]

var arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]

var flattenedArray = arrayOfArrays.flatMap { array in
    return array.map { integer in
        return integer * 2
    }
}
print(flattenedArray) // outputs: [ 2, 2, 4, 4, 6, 6 ]

let numbers: [Int] = [1, 2, 3]

let numbersMap = numbers.map { return $0 }
print(numbersMap) // [1, 2, 3]

let numbersFlatMap = numbers.flatMap { return $0 }
print(numbersFlatMap) // [1, 2, 3]

let numbers: [Int?] = [1, nil, 3]

let numbersMap = numbers.map { return $0 }
print(numbersMap) // [Optional(1), nil, Optional(3)]

let numbersFlatMap = numbers.flatMap { return $0 }
print(numbersFlatMap) // [1, 3]

// [ [2, 2], [4, 4], [6, 6] ]