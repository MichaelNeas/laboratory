let values = [2.0,4.0,5.0,7.0]
var squares: [Double] = []
for value in values {
  squares.append(value*value)
}

let squares2 = values.map {$0 * $0}
// [4.0, 16.0, 25.0, 49.0]

let squares3 = values.map({
  (value: Double) -> Double in
  return value * value
})

let squares4 = values.map {value in value * value}

let squares5 = values.map { $0 * $0 }

let scores = [0,28,124]
let words = scores.map { NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut) }
// ["zero", "twenty-eight", "one hundred twenty-four"]

let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }

let digits = [1,4,10,15]
let even = digits.filter { $0 % 2 == 0 }
// [4, 10]


let items = [2.0,4.0,5.0,7.0]
let total = items.reduce(10.0, +)
// 28.0

let codes = ["abc","def","ghi"]
let text = codes.reduce("", +)
// "abcdefghi"


let names = ["alan","brian","charlie"]
let csv = names.reduce("===") {text, name in "\(text),\(name)"}
// "===,alan,brian,charlie"

let collections = [[5,2,7],[4,8],[9,1,3]]
let flat = collections.flatMap { $0 }
// [5, 2, 7, 4, 8, 9, 1, 3]

let people: [String?] = ["Tom",nil,"Peter",nil,"Harry"]
let valid = people.flatMap {$0}
// ["Tom", "Peter", "Harry"]