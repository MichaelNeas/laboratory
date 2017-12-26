//Given 2 integer arrays, determine if the 2nd array is a rotated
const data = [1,2,3,4,5,6,7,8,9];
const data1 = [9,8,7,6,5,4,3,2,1];
const data2 = [9,8,7,6,5,4,3,2,2];
const A=[1,2,3,5,6,7,8]; 
const B=[5,6,7,8,1,2,3]; 
const C=[5,6,7,8,1,2,4];

const dataObj = {
    data: data,
    data1: data1,
    data2: data2,
    A: A,
    B: B,
    C: C
};

(function secondRotated(dataObj){
    let isReversed = (arr1, arr2) => {
        if(arr1.length === arr2.length){
            let i;
            const arrSize = arr1.length-1;
            for(i=0; i<arrSize; i++){
                if(arr1[i]!==arr2[arrSize-i]){
                    return false;
                }
            }
            return true;
        }
        return false;
    };
    console.log(isReversed(dataObj.data, dataObj.data1));
    console.log(isReversed(dataObj.data, dataObj.data2));
    //O(n^2) tho the sum should be the same that doesn't mean they're equal
    let isARotatedBRUTE = (arr1, arr2) => {
        if(arr1.length === arr2.length){
            //make a copy of arr2
            let temp = [...arr2];
            arr1.forEach(element => {
                let i;
                for(i=0;i<arr1.length;i++){
                    if(element === temp[i]){
                        //console.log(element, ": found! ", arr2)
                        temp.splice(i,1);
                    }
                }
            });
            return temp.length>0 ? false : true;
        }
        return false;
    };
    console.log(isARotatedBRUTE(dataObj.A, dataObj.B));
    console.log(isARotatedBRUTE(dataObj.A, dataObj.C));

    //nlogn
    let sortedRotation = (arr1, arr2) => {
        if(arr1.length === arr2.length){
            arr1.sort();
            arr2.sort();
            let i;
            for(i=0;i<arr1.length; i++){
                if(arr1[i] !== arr2[i])
                    return false;
            }
            return true;
        }
        return false;
    }
    console.log(sortedRotation(dataObj.A, dataObj.B));
    console.log(sortedRotation(dataObj.A, dataObj.C));
})(dataObj);