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
    //tho the sum should be the same that doesn't mean they're equal
    let isARotatedBRUTE = (arr1, arr2) => {
        if(arr1.length === arr2.length){
            arr1.forEach(element => {
                let i;
                for(i=0;i<arr1.length;i++){
                    if(element === arr2[i]){
                        //console.log(element, ": found! ", arr2)
                        arr2.splice(i,1);
                    }
                }
            });
            return arr2.length>0 ? false : true;
        }
        return false;
    };
    console.log(isARotatedBRUTE(dataObj.A, dataObj.B));
    console.log(isARotatedBRUTE(dataObj.A, dataObj.C));
})(dataObj);