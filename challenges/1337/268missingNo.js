/** 
 * Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 * divergent series
 * @param {number[]} nums
 * @return {number}
 */
var missingNumber = function(nums) {
    let sum = 0
    for(let i=0; i<nums.length; i++){
        sum += nums[i]
    }
    return divergentSummation(nums.length) - sum
};

let divergentSummation = n => ((n*(n+1))/2)