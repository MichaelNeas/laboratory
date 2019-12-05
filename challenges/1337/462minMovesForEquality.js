/**
 * Given a non-empty integer array, find the minimum number of moves required to make all array elements equal, where a move is incrementing a selected element by 1 or decrementing a selected element by 1.
 * You may assume the array's length is at most 10,000.
 * @param {number[]} nums
 * @return {number}
 */
var minMoves2 = function(nums) {
    nums.sort((a,b) => a-b)
    let count = 0
    let l = 0
    let r = nums.length-1
    while(l < r){
        count += nums[r]-nums[l]
        l++
        r--
    }
    return count
};