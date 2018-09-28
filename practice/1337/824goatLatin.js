/**
 * 
    If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
    For example, the word 'apple' becomes 'applema'.
     
    If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
    For example, the word "goat" becomes "oatgma".
     
    Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
    For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.

 * @param {string} S
 * @return {string}
 */
var toGoatLatin = function(S) {
    let arr = S.split(" ")
    let vowelSet = new Set(["a", "e", "i", "o", "u"])
    for(let i=0; i<arr.length; i++){
        if(!vowelSet.has(arr[i][0].toLowerCase())){
            arr[i]+=arr[i][0]
            arr[i] = arr[i].substr(1)
        }
        arr[i] += "ma"
        for(let j = 0; j<=i; j++){
            arr[i] += "a"
        }
    }
    return arr.join(" ")
};