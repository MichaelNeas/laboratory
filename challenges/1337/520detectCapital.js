/**
 * Given a word, you need to judge whether the usage of capitals in it is right or not. 
 * @param {string} word
 * @return {boolean}
 */
var detectCapitalUse = function(word) {
    let capitalPrev = false
    if(word.charCodeAt(0) < 97)
        capitalPrev = true
    for(let i=1; i<word.length; i++){
        if(word.charCodeAt(i) < 97 && !capitalPrev)
            return false
        else if(word.charCodeAt(i) >= 97 && capitalPrev && i != 1)
            return false
        if(word.charCodeAt(i) < 97)
            capitalPrev = true
        else capitalPrev = false
    }
    return true
};