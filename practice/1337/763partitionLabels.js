/**
 *  A string S of lowercase letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts. 
 * @param {string} S
 * @return {number[]}
 */
var partitionLabels = function(S) {
    //count em up
    let totalsMap = [...S].reduce((prev, curr) => {
        prev[curr] ? prev[curr] += 1 : prev[curr] = 1
        return prev
    }, {})
    
    let notFullfilled = {};
    let letters = new Set()
    let count = 0
    let ans = []
    for(let i = 0; i<S.length; i++){
        letters.add(S[i])
        notFullfilled[S[i]] ? notFullfilled[S[i]] += 1 : notFullfilled[S[i]] = 1
        if(totalsMap[S[i]] === notFullfilled[S[i]]){
            letters.delete(S[i])
            delete notFullfilled[S[i]]
        }
        count++
        if(letters.size === 0){
            ans.push(count)
            count = 0
        }
    }
    return ans
};