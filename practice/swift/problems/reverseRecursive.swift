import Foundation

var str = "a string"

func recursiveReverse(_ someString: String) {
    var someString = someString

    if someString.count <= 1 {
        print(someString, terminator:"")
    } else {
        print(someString.remove(at: someString.index(before: someString.endIndex)), terminator:"")
        recursiveReverse(someString)
    }
}

recursiveReverse(str)