import Foundation

struct Test {
    static func one() -> Int? {
        print("1")
        return 1
    }
    static func two() -> Int? {
        print("2")
        return 2
    }
    static func three() -> Int? {
        print("3")
        return 3
    }

    var mapping: [Int : () -> Int?] = [
        1 : one,
        2 : two,
        3 : three
    ]

    func test(val: Int) -> Int {
        return mapping[val]!()!
    }
}
let testStruct = Test()
testStruct.test(val: 1)
testStruct.test(val: 2)
