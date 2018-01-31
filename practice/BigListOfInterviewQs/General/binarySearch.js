//Implement binary search of a sorted array of integers
let data = [1,2,3,4,5,6,7,8,9,10,64,321,432,12346,99999999];

function binarySearch(data){
    let iterative = target => {
        let temp = [...data];
        while(temp.length > 1){
            let pivot = Math.floor(temp.length/2);
            if(temp[pivot] === target)
                return `Found: ${temp[pivot]} iteratively.`;
            else if(temp[pivot] > target)
                temp = temp.slice(0,pivot)    
            else
                temp = temp.slice(pivot, temp.length)
        }
        return `${target} does not exist in ${data}`;
    }

    let getIndex = target => {
        let rBound = data.length-1;
        let lBound = 0;
        let pivot;
        while(lBound <= rBound){ 
            pivot = Math.floor((rBound+lBound)/2);
            if(data[pivot] === target)
                return `Found: ${data[pivot]} at index: ${pivot}`;
            else if(data[pivot] < target){
                lBound = pivot + 1;
            }
            else{
                rBound = pivot - 1;
            }
                
        }
        return `${target} does not exist in ${data}`;
    }

    return {
        iteratively: iterative,
        getIndex: getIndex
    }
};

console.log(binarySearch(data).iteratively(5));
console.log(binarySearch(data).getIndex(8));
console.log(binarySearch(data).iteratively(61));
console.log(binarySearch(data).getIndex(9876));
console.log(binarySearch(data).getIndex(0));