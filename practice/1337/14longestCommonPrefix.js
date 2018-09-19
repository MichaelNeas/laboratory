/**
 * Write a function to find the longest common prefix string amongst an array of strings.
 * If there is no common prefix, return an empty string "".
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
    if(strs.length === 0) return ""
    strs.sort((a,b)=>a.length>b.length)
    let prefix = ""
    for(let j=0; j<strs[0].length; j++){
        let peep = strs[0][j]
        for(let i=0;i<strs.length;i++){
            if(peep !== strs[i][j]){
               return prefix
            }
        }
        prefix += peep
    }

    return prefix
};