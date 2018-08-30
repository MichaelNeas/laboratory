/**
 * Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 * You may assume that each input would have exactly one solution, and you may not use the same element twice.
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
 
var twoSum = function(nums, target) {
    let ans = [];
    for(var i=0; i< nums.length-1; i++){
        for(var j=i+1; j<nums.length; j++){
            if(nums[i]+nums[j]===target){
                ans.push(i);
                ans.push(j);
                return ans;
            }
        }
    }
};

// 1 iteration keep hashmaps
var twoSum = function(nums, target) {
    var ans = [];
    var exist = {};
    
    for (var i = 0; i < nums.length; i++){
        if (typeof(exist[target-nums[i]]) !== 'undefined'){
            return [exist[target - nums[i]], i];
        }
        exist[nums[i]] = i;
    }
}