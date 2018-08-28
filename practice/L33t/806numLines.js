/**
 * We are to write the letters of a given string S, from left to right into lines. Each line has maximum width 100 units, and if writing a letter would cause the width of the line to exceed 100 units, it is written on the next line. We are given an array widths, an array where widths[0] is the width of 'a', widths[1] is the width of 'b', ..., and widths[25] is the width of 'z'.
 * Now answer two questions: how many lines have at least one character from S, and what is the width used by the last such line? Return your answer as an integer list of length 2.
 * @param {number[]} widths
 * @param {string} S
 * @return {number[]}
 */
var numberOfLines = function(widths, S) {
    let lines = 1;
    let count = 0;
    for(let i=0;i<S.length; i++){
        let val = widths[S.charCodeAt(i) - 97]
        if(count + val > 100){
            lines++
            count = val
        }else{
            count += val
        }
    }
    return [lines,count]
};