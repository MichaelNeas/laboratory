//Find the common elements of 2 int arrays 
let data = [1,5,3,2,5,5,1,2,2,2,1,4,3,6];
let data2 = [10,12,14,1,5,2,9];

(function findCommon(arr1, arr2){
    //O(n^2)
    let arr1Uniques = new Set(arr1);
    let arr2Uniques = new Set(arr2);
    let common = [];
    arr1Uniques.forEach(val => {
        if(arr2Uniques.has(val))
            common.push(val);
    });
    console.log(`Using an n^2 alg we have these common elements: ${common}`);

    arr1.sort((a, b) => a-b);
    arr2.sort((a, b) => a-b);
    let otherAns = arr1.reduce((acc, curr) => {
        while(curr > arr2[0]){
            arr2.shift();
        }
        if(curr===arr2[0] && acc[acc.length-1] !== curr)  
            acc.push(curr);
        return acc;
    }, []);
    console.log(`Using sorting we have these common elements: ${otherAns}`);
})(data, data2);