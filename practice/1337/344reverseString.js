/** reverse a string
 * @param {string} s
 * @return {string}
 */
var reverseString = function(s) {
    return [...s].reverse().join("")
};

var reverseStringFaster = function(s) {
    var reversedStr = "";
    var high = s.length - 1;
    var i;
    for(i = high; i >= 0; i--) {
        reversedStr += s.charAt(i);
    }
    return reversedStr;
}