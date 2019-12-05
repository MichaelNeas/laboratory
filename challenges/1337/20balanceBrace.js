/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
    let stack = []
    for(let i=0; i<s.length; i++){
        ( s.charAt(i) === "}" && stack[stack.length-1] === "{" || 
          s.charAt(i) === ")" && stack[stack.length-1] === "(" ||
          s.charAt(i) === "]" && stack[stack.length-1] === "[" )
         ? stack.pop() : stack.push(s[i])
    }
    return stack.length === 0
};