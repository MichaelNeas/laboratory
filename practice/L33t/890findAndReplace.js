/**
 * Input: words = ["abc","deq","mee","aqq","dkd","ccc"], pattern = "abb"
 * Output: ["mee","aqq"]
 * Explanation: "mee" matches the pattern because there is a permutation {a -> m, b -> e, ...}. 
 * "ccc" does not match the pattern because {a -> c, b -> c, ...} is not a permutation,
 * since a and b map to the same letter.
 * @param {string[]} words
 * @param {string} pattern
 * @return {string[]}
 */
var findAndReplacePattern = function(words, pattern) {
    return words.reduce((prev, curr) => {
        //first check if they're even equal lengths
        if (curr.length != pattern.length){
            return prev
        }
        
        let previousMatches = new Map()
        let previousOtherMatches = new Map()
        for(let i=0;i<curr.length;i++){
            if(previousMatches.get(pattern[i]) === undefined && previousOtherMatches.get(curr[i]) === undefined){
                previousMatches.set(pattern[i], curr[i])
                previousOtherMatches.set(curr[i], pattern[i])
            }else if(previousMatches.get(pattern[i]) !== curr[i] && previousOtherMatches.get(curr[i]) !== pattern[i]){
                return prev
            }
            
        }
        prev.push(curr)
        return prev
    }, [])
};