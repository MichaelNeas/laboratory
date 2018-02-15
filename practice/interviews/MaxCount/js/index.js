const assert = require('assert');
/*
* NOT IDEAL
* Iterates through the numberArray and returns the 
* max count of numbers found in a row
* Requires sorting of unsorted array
* @param [numberArray]
* @return Number
*/
const maxCount = numberArray =>{
  numberArray = numberArray.sort();
  let currentMax = 0;
  let tempMax = 1;
  let i;
  for(i = 0; i < numberArray.length; i++){
    if(numberArray[i] === numberArray[i+1]){
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

/*
* Refactor
* Iterates through the numberArray and returns a tuple of 
* value found the most times and how many times it occured
* @param [numberArray]
* @return [value,count]
*/
const maxCountWithValue = numberArray => {
  let hashed = numberArray.reduce((acc, curr, i, arr) => {
    acc.has(curr) ? acc.set(curr, acc.get(curr) + 1) : acc.set(curr, 1);
    return acc;
  }, new Map());
  let ans = [...hashed].reduce((acc, curr, i, arr) => {
    if(curr[1] > acc[1])
      return curr;
    return acc;
  }, [0,0]);
  return ans;
}

/*
* Some assertions
*/
const numbers = [3,4,5,5,9,10,10,14,14,14,14,14,14,14,14];
const singleNumbers = [0];
const noNumbers = [];
const allSameNumbers =[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
const randomNumbers = [5, 3, 12, 45, 12, 3, 5, 1, 3, 2, 5, 9, 4, 12, 5, 7, 8, 10];
const data = [1,2,3,4,5,6,7,8,5,6,8,6,4,3,43,5,5,3,567,7,4,234,4,23,43,43,3,2,2,45,3,4];

assert.equal(maxCount(numbers), maxCountWithValue(numbers)[1], `Results differ with ${numbers}`);
assert.equal(maxCount(singleNumbers), maxCountWithValue(singleNumbers)[1], `Results differ with ${singleNumbers}`);
assert.equal(maxCount(noNumbers), maxCountWithValue(noNumbers)[1], `Results differ with ${noNumbers}`);
assert.equal(maxCount(allSameNumbers), maxCountWithValue(allSameNumbers)[1], `Results differ with ${allSameNumbers}`);
assert.equal(maxCount(randomNumbers), maxCountWithValue(randomNumbers)[1], `Results differ with ${randomNumbers}`);
assert.equal(maxCountWithValue(numbers)[0], 14, `Value returned differs from expected using numbers array`);
assert.equal(maxCountWithValue(singleNumbers)[0], 0, `Value returned differs from expected using singleNumbers array`);
assert.equal(maxCountWithValue(noNumbers)[0], 0, `Value returned differs from expected using noNumbers array`);
assert.equal(maxCountWithValue(allSameNumbers)[0], 1, `Value returned differs from expected using allSameNumbers array`);
assert.equal(maxCountWithValue(randomNumbers)[0], 5, `Value returned differs from expected using randomNumbers array`);