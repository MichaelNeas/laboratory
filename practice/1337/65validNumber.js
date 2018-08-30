/**
 * validate if a given string is numeric
 * @param {string} s
 * @return {boolean}
 */
var isNumber = function(s) {
    return s === " " ? false:Number(s) == s
};