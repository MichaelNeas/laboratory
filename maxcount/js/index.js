let numbers = [3,4,5,5,9,10,10,14,14,14,14,14,14,14,14];
let singleNumbers = [0];
let noNumbers = [];
let allSameNumbers =[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
/*
* maxCount(array)
* Iterates through the array and returns the 
* max count of numbers found in a row.
*/
function maxCount(array){
  let currentMax = 0;
  let tempMax = 1;
  let i;
  for(i = 0; i < array.length; i++){
    if(array[i] === array[i+1]){
      tempMax++;
    }else{
      if(tempMax > currentMax){
        currentMax = tempMax;
      }
      tempMax = 1; 
    }
  }
  return currentMax;
}

console.log(maxCount(numbers));
console.log(maxCount(singleNumbers));
console.log(maxCount(noNumbers));
console.log(maxCount(allSameNumbers))