//Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
//Input: "Let's take LeetCode contest"
//Output: "s'teL ekat edoCteeL tsetnoc"

/**
 * @param {string} s
 * @return {string}
 */
var reverseWords = function(s) {
    return s.split(" ").map(word => word.split("").reverse().join("")).join(" ")
};