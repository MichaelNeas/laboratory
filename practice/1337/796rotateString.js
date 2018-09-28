/**
 * A shift on A consists of taking string A and moving the leftmost character to the rightmost position. 
 * For example, if A = 'abcde', then it will be 'bcdea' after one shift on A. Return True if and only if A can become B after some number of shifts on A.
 * @param {string} A
 * @param {string} B
 * @return {boolean}
 */
var rotateString = function(A, B) {
    for(let i = 0; i<A.length; i++){
        if(A === B) return true
        else {
            A += A[0]
            A = A.substr(1)
        }
    }
    return A === B 
};

/**
 * @param {string} A
 * @param {string} B
 * @return {boolean}
 */
var rotateString = (A, B) => (B + B).indexOf(A) != -1 && A.length == B.length