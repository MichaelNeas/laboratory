/**
 * Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
 * Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function(nums) {
    let temp = nums[0]
    for(let i=1; i<nums.length;i++){
        if(temp === nums[i]){
            nums.splice(i, 1)
            i--
        }else
            temp = nums[i]
    }
    return nums.length
};

//100%
/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function(nums) {
	var i = 0; // last index in the non duplicated part
	for (var j=1; j<nums.length; j++){ 
		if (nums[i] != nums[j]){
			nums[i+1] = nums[j];
			i = i+1;
		}
	}
	return i+1;
};