// Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cab" can be written as "-.-.-....-", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.
/**
 * @param {string[]} words
 * @return {number}
 */
var uniqueMorseRepresentations = function(words) {
    let codes = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    let dict = new Map()
    words.forEach(word => {
        let tempString = ""
        for(let i=0; i<word.length; i++){
            tempString += codes[word.charCodeAt(i) - 97]
        }
        dict.set(tempString, 0)
    })
    return dict.size
};

// Neat sol
const codes = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."];
const mapper = char => codes[char.charCodeAt(0) - 'a'.charCodeAt(0)];
const uniqueMorseRepresentations = words => 
    new Set(words.map(word => word.split('').map(mapper).join(''))).size;