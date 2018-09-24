// All the stuff you can do with es6 sets and maps
let myMap = new Map()
myMap.set(1, "hi")
myMap.set(1, "bye")
myMap.get(1)
console.log(myMap.get(1))
myMap.set(2, "hello again")
for(val of myMap.entries()){
    console.log(val)
}
console.log(...myMap.entries())
myMap.forEach((val, key, map) => console.log(`Val ${val}, Key ${key}, Map val access: ${map.get(key)}`))

for(key of myMap.keys()) console.log(key)
for(val of myMap.values()) console.log(val)

let iterator = myMap.entries()

while (true) {
    let result = iterator.next()
    if (result.done) break
    console.log(result.value) 
}

console.log(myMap.size)
console.log(myMap.delete(1)) // bool return for ack
console.log(myMap.delete(2))
console.log(myMap.size)

myMap.set(4, "oye")
console.log(myMap.clear()) // returns undefined
console.log(myMap.size)

// SETS
console.log("========== SETS ==========")
let mySet = new Set()
mySet.add(1)
mySet.add(2)
console.log(mySet.has(1))
mySet.add(3)
console.log(mySet.add(2))
for(val of mySet.entries()){
    console.log(val)
}
console.log(...mySet.entries())
mySet.forEach((val1, val2, set) => console.log(`Val ${val1}, Key ${val2}, Map val access: ${set.has(val1)}`))

for(val of mySet.values()) console.log(val)

let setIterator = mySet.entries()

while (true) {
    let result = setIterator.next()
    if (result.done) break
    console.log(result.value) 
}

console.log(mySet.size)
console.log(mySet.delete(1)) // bool return for ack
console.log(mySet.delete(2))
console.log(mySet.size)

mySet.add(4)
console.log(mySet.clear()) // returns undefined
console.log(mySet.size)