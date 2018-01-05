//Implement binary search in a rotated array (ex. {5,6,7,8,1,2,3})
let data = [5,6,7,8,1,2,3];

function binarySearchRotated(data){
    let getIndex = target => {
        let rBound = data.length-1;
        let lBound = 0;
        let pivot;
        while(lBound <= rBound){ 
            pivot = Math.floor((rBound+lBound)/2);
            if(data[pivot] === target)
                return `Found: ${data[pivot]} at index: ${pivot}`;
            else if(data[lBound] < data[pivot]){
                if (data[lBound] <= target && target < data[pivot])
                    rBound = pivot - 1;
                else
                    lBound = pivot + 1;
            }
            else{
                if(target <= data[rBound] && data[pivot] < target)
                    lBound = pivot + 1;    
                else
                    rBound = pivot - 1;
                
            }
        }
        return `${target} does not exist in ${data}`;
    }

    return {
        getIndex: getIndex
    }
};

console.log(binarySearchRotated(data).getIndex(5));
console.log(binarySearchRotated(data).getIndex(8));
console.log(binarySearchRotated(data).getIndex(3));
console.log(binarySearchRotated(data).getIndex(9876));
console.log(binarySearchRotated(data).getIndex(0));