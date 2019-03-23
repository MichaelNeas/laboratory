import Foundation

let names = ["a", "b", "c", "b", "c", "d"]
let prices = [1, 3, 5, 3, 20, 32]
let weights = [100.1, 85, 53, 85, 42.3, 101.4]

public struct Product: Hashable {
    var name: String
    var price: Int
    var weight: Double
}

var productSet: Set = Set<Product>()
var dupeCount = 0

for i in 0..<names.count {
    let product = Product(name: names[i], price: prices[i], weight: weights[i])
    if productSet.contains(product){
        dupeCount+=1
    } else {
        productSet.insert(product)
    }
}

print(dupeCount)

// tuples can't be hashable
// typealias Product = (String, UInt, Double)

// extension Product: Hashable {
// }

// var productSet: Set = Set<Product>()

let bucketSizes =  [10, 8, 5, 11, 20, 13]
let bucketStates = [5,  3, 2, 10, 11, 9]

var totalWater = bucketStates.reduce(0,+)
for (i, bucket) in bucketSizes.sorted(by: >).enumerated() {
    if bucket >= totalWater {
        print(i + 1)
        break
    } else {
        totalWater -= bucket
    }
}