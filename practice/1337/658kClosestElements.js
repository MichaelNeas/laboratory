/**
 * LOL falsy got me liiiiike
 * @param {number[]} arr
 * @param {number} k
 * @param {number} x
 * @return {number[]}
 */
var findClosestElements = function(arr, k, x) {
    let index = binarySearch(x, arr, 0, arr.length)
    return closestScanner(index, k, arr, x)
};

let binarySearch = (el, array, l, r) => {
    let middle = l + Math.floor((r - l)/2);
    if(el === array[middle] || l+1 === r || r-1 === l ){
        return middle
    }else if(el < array[middle]){
        return binarySearch(el, array, l, middle)
    }else{
        return binarySearch(el, array, middle, r)
    }
}

let closestScanner = (i, amount, array, goal) => {
    let rightPtr = i+1
    let leftPtr = i-1
    let sol = [array[i]]
    let count = sol.length
    while(count < amount){
        if(array[leftPtr] != undefined && array[rightPtr] == undefined){
            sol.unshift(array[leftPtr])
            leftPtr--
        } else if(array[leftPtr] == undefined && array[rightPtr] != undefined){
            sol.push(array[rightPtr])
            rightPtr++
        } else {
            if(goal-array[leftPtr] > array[rightPtr]-goal){
                sol.push(array[rightPtr])
                rightPtr++
            } else {
                sol.unshift(array[leftPtr])
                leftPtr--
            }
        }
        count++
    }
    return sol
}


let findClosestElements = (arr, k, x) => {
    arr.sort((a,b) => a == b ? a - b : Math.abs(a-x) - Math.abs(b-x));
    arr = arr.splice(0, k);
    arr.sort()
    return arr;
}