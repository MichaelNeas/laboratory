/**
 * Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 * @param {number[]} nums
 * @return {number}
 */
let singleNumber = nums => nums.reduce((prev, curr) => curr ^ prev,0)