/**
 * Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 * You may assume that the array is non-empty and the majority element always exist in the array.
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function(nums) {
    nums.sort()
    let maxCount = 1
    let max = nums[0]
    let curr = max
    let currCount = 1
    for(let i=1;i<nums.length; i++){
        if(nums[i] === curr){
            currCount++
        }else{
            if(currCount > maxCount){
                max = curr
                maxCount = currCount
            }
            currCount = 1
            curr = nums[i]
        }
    }
    if(currCount > maxCount) return curr
    return max
};


var majorityElement = function(nums) {
    var obj = {};
    
    for(var i = 0; i < nums.length; i++){
        obj[nums[i]] = obj[nums[i]] + 1 || 1;
        if(obj[nums[i]] > nums.length / 2)  return nums[i];
    }
    
};