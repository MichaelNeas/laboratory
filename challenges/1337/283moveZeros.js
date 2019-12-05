/**
 * Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
    let limit = nums.length
    for(let i=0; i<limit; i++){
        if(nums[i] === 0){
            nums.push(nums.splice(i, 1)[0])
            limit--
            i--
        }
    }
};