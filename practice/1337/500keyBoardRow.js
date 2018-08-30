/**
 * Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below. 
 * @param {string[]} words
 * @return {string[]}
 */
var findWords = function(words) {
    let top = new RegExp('[qwertyuiop]', 'gi');
    let mid = new RegExp('[asdfghjkl]', 'gi');
    let bot = new RegExp('[zxcvbnm]', 'gi');
    
    return words.reduce((prev, word, index) => {
        console.log(word)
        if(word.match(top) && word.match(top).length === word.length || 
           word.match(mid) && word.match(mid).length === word.length || 
           word.match(bot) && word.match(bot).length === word.length){
            prev.push(word)    
        }
        return prev
    }, [])
};

var refactorFindWords = words => {
    let arr = [];
    words.map(key=>{
        let cnt = /[qwertyuiop]/gi.test(key) + /[asdfghjkl]/gi.test(key) + /[zxcvbnm]/gi.test(key);
        if(cnt===1){
            arr.push(key);
        }
    })
    return arr;
}