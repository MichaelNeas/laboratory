/**
 * Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 * @param {string} s
 * @return {boolean}
 */
var isPalindrome = function(s) {
    s = s.replace(/\W/g, '').toLowerCase()
    for(let i=0; i<Math.floor(s.length/2); i++){
        if(s[i]!==s[s.length-1-i])
            return false
    }
    return true
};