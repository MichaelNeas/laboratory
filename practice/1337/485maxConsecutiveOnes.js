/**
 * Given a binary array, find the maximum number of consecutive 1s in this array.
 * @param {number[]} nums
 * @return {number}
 */
var findMaxConsecutiveOnes = function(nums) {
    let max = 0
    let curr = 0
    for(let i =0;i<nums.length;i++){
        if(nums[i] === 1){
            curr++
        }else{
            if(curr>max)
                max = curr
            curr = 0
        }
    }
    if(curr>max)
        return curr
    return max 
};