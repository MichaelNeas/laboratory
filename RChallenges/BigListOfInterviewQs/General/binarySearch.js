//Implement binary search of a sorted array of integers
let data = [1,2,3,4,6,7,8,9,10,12,13,44,53,61];

function binarySearch(data){
    return iterative = target => {
        let temp = data;
        while(temp.length > 1){
            let pivot = Math.floor(temp.length/2);
            if(temp[pivot] === target)
                return `Found: ${temp[pivot]}`;
            else if(temp[pivot] > target)
                temp = temp.slice(0,pivot)    
            else
                temp = temp.slice(pivot, temp.length)
        }
        return `${target} does not exist in ${data}`;
    }
};

console.log(binarySearch(data)(5));
console.log(binarySearch(data)(8));
console.log(binarySearch(data)(61));
console.log(binarySearch(data)(9876));
console.log(binarySearch(data)(0));