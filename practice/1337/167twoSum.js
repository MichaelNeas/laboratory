/**
 * Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 * The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 * @param {number[]} numbers
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(numbers, target) {
    let left = 0
    let right = numbers.length-1
    while(left < right){
        if(numbers[left]+numbers[right] === target) return [left+1,right+1]
        numbers[left]+numbers[right] > target ? right-- : left++
    }
    return null
};