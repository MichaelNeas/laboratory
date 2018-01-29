//Implement merge sort O(nlogn)

let data = [20, 12, 10, 15, 2, 64, 25, 12, 22, 11];

let merge = (oneArray, anotherArray) => {
    let mergedArray = [];
    while(oneArray.length > 0 || anotherArray.length > 0){
        if(oneArray.length === 0) mergedArray.push(anotherArray.shift());
        if(anotherArray.length === 0) mergedArray.push(oneArray.shift());
        if(oneArray[0] < anotherArray[0])
            mergedArray.push(oneArray.shift());
        else{
            mergedArray.push(anotherArray.shift());
        }
    }
    return mergedArray;
}

let mergeSort = arr => {
    if(arr.length <= 1)
        return arr;

    let left = [];
    let right = [];
    arr.forEach((element, index) => {
        if (index < (arr.length)/2)
            left.push(element);
        else
            right.push(element);
    });
    console.log(`Left: ${left}, Right: ${right}`)
    left = mergeSort(left);
    right = mergeSort(right);
    console.log(`MERGING Left: ${left}, Right: ${right}`)
    return merge(left, right);
}

console.log(`output: ${mergeSort(data)}`);