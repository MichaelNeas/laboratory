/**
 * Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function(nums, target) {
    return binarySearch(target, nums, 0, nums.length)
};

let binarySearch = (el, array, l, r) => {
    let middle = l + Math.floor((r - l)/2);
    if(el === array[middle] || l+1 === r || r-1 === l )
        if(array[middle] < el)
            return middle+1
        else
            return middle
    else if(el < array[middle])
        return binarySearch(el, array, l, middle)
    else
        return binarySearch(el, array, middle, r)
}



var searchInsert = function(nums, target) {
    let out =nums.indexOf(target);
    if (out == -1){
        let i = 0
        for (; target > nums[i] ; i++){};
        out = i;
    }
    return out ;
};