// Given an array find the max sum sub array
// Kandane's algorithm is the best https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/

let maxMiddleSum = (arr, left, middle, right) => {
    let sum = 0
    let leftSum = Number.MIN_VALUE
    for(let i = middle; i >= left; i--){
        sum += arr[i]
        if(sum > leftSum)
            leftSum = sum
    }

    sum = 0
    let rightSum = Number.MIN_VALUE
    for(let i = middle + 1; i <= right; i++){
        sum += arr[i]
        if(sum > rightSum)
            rightSum = sum
    }
    return leftSum + rightSum
}

let maxSubArraySum = (arr, left, right) => {
    if (left === right) return arr[left]

    let middle = Math.floor((left + right)/2)
    /* Return maximum of following three 
    possible cases:
    a) Maximum subarray sum in left half
    b) Maximum subarray sum in right half
    c) Maximum subarray sum such that the 
    subarray crosses the midpoint */
    return Math.max(Math.max(maxSubArraySum(arr, left, middle),
                    maxSubArraySum(arr, middle+1, right)),
                    maxMiddleSum(arr, left, middle, right));
}

let arr = [1,3,4,1,-41,5,6]
console.log(maxSubArraySum(arr, 0, arr.length-1))