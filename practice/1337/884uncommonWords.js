/**
 * A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.
 * @param {string} A
 * @param {string} B
 * @return {string[]}
 */
var uncommonFromSentences = function(A, B) {
    let bank = new Map()
    A.split(" ").forEach(el => bank.get(el) ? bank.set(el, -1) : bank.set(el, 1))
    B.split(" ").forEach(el => bank.get(el) ? bank.set(el, -1) : bank.set(el, 1))
    
    let ans = []
    bank.forEach((val, key) => {
        if(val === 1){
            ans.push(key)
        }
    })
    return ans
}