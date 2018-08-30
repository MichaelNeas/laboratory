/**
* You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  
* Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
* The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
**/
/**
 * @param {string} J
 * @param {string} S
 * @return {number}
 */
var numJewelsInStones = function(J, S) {
    let count = 0
    for(let i=0;i<J.length;i++){
        for(let j=0;j<S.length;j++){
            if(J.charAt(i) === S.charAt(j)) count++
            S.replace(J.charAt(i),'')
        }
    }
    return count
};

// O(1) space, O(mn) runtime
var numJewelsInStones = function(J, S) {
    var count = 0;
    
    for(a = 0; a < S.length; a++){
        for(b = 0; b < J.length; b++){
            if(S[a] === J[b]){
                count++;
            }
        }
    }
    
    return count;
};


// O(m) extra space, O(m+n) runtime
var numJewelsInStones = function(J, S) {
    var count = 0;
    let jewels = new Map();
    for (let j of J) jewels.set(j, 0);
    for (let s of S) {
      if (jewels.has(s)) count++;
    }
    return count;
  };