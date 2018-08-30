//reorder an array in place using only rand and floor

let reorderRandomly = arr => {
    //HUGE force of reduce haha, but i love reduce
    return arr.reduce((prev, curr, i) => {
        let newHome = Math.floor((Math.random() * (arr.length - 1)))
        let temp = arr[newHome] 
        arr[newHome] = curr
        arr[i] = temp
        return arr
    }, arr)
}

let differentReOrderRandomly = arr => {
    arr.forEach((element, i) => {
        let newHome = Math.floor((Math.random() * (arr.length - 1)))
        let temp = arr[newHome] 
        arr[newHome] = element
        arr[i] = temp
    });
    return arr
}

console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(reorderRandomly([1,2,3,4,5,6]))
console.log(differentReOrderRandomly([1,2,3,4,5,6]))

for(let i = 0; i<100; i++){
    console.log(reorderRandomly([1,2,3,4,5,6]))
    console.log(reorderRandomly([1,2,3,4,5,6]))
    console.log(differentReOrderRandomly([1,2,3,4,5,6]))
}