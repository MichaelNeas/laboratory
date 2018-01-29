//Implement merge sort O(nlogn)

let data = [20, 12, 10, 15, 2, 64, 25, 12, 22, 11];

let merge = (oneArray, anotherArray) => {
    let mergedArray = [];
    while(oneArray.length > 0 || anotherArray.length > 0){
        //Boolean(undefined comparisons) eval to false
        if(oneArray[0] <= anotherArray[0])
            mergedArray.push(oneArray.shift());
        else if(oneArray[0] > anotherArray[0]){
            mergedArray.push(anotherArray.shift());
        }
        if(oneArray.length === 0) {
            mergedArray.push(...anotherArray);
            anotherArray = [];
        }
        if(anotherArray.length === 0) {
            mergedArray.push(...oneArray);
            oneArray = [];
        }
    }
    console.log(`Merged into: ${mergedArray}`);
    return mergedArray;
}

let mergeSort = arr => {
    if(arr.length <= 1)
        return arr;

    let left = [];
    let right = [];
    let middle = arr.length/2;

    arr.forEach((element, index) => index < middle ? left.push(element) : right.push(element));
    console.log(`Left: ${left}, Right: ${right}`)

    left = mergeSort(left);
    right = mergeSort(right);
    console.log(`Merging -> Left: ${left} ---- Right: ${right}`)
    
    return merge(left, right);
}

console.log(`output: ${mergeSort(data)}`);