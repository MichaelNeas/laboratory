/**
 * Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 * @param {string} s
 * @return {number}
 */
var lengthOfLastWord = function(s) {
    let arr = s.match(/\S+/g) || []
    if(arr.length === 0) return 0
    return arr[arr.length-1].length
};