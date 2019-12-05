/**
 * Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 * @param {number[]} nums1
 * @param {number} m
 * @param {number[]} nums2
 * @param {number} n
 * @return {void} Do not return anything, modify nums1 in-place instead.
 */
var merge = function(nums1, m, nums2, n) {
    let onePlace = 0
    nums1.splice(m, nums1.length)
    for(let i = 0; i<n; i++){
        while(nums1[onePlace] < nums2[i]){
            onePlace++
        }
        nums1.splice(onePlace, 0, nums2[i])
    }
};