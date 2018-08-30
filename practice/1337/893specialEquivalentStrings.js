/** not the fastest but kind of cool
 * Odds can swap with odds, evens can swap with evens, twist on anagram
 * You are given an array A of strings.
 * Two strings S and T are special-equivalent if after any number of moves, S == T.
 * A move consists of choosing two indices i and j with i % 2 == j % 2, and swapping S[i] with S[j].
 * Now, a group of special-equivalent strings from A is a non-empty subset S of A such that any string not in S is not special-equivalent with any string in S.
 * Return the number of groups of special-equivalent strings from A.
 * @param {string[]} A
 * @return {number}
 */
var numSpecialEquivGroups = function(A) {
    return A.reduce((prev, curr) => {
        let left = ""
        let right = ""
        for(let i=0; i<curr.length; i++){
            i%2===0 ? left += curr[i] : right += curr[i] 
        }
        left = [...left].sort().join("")
        right = [...right].sort().join("")
        for(let i=0; i<prev.length; i++){
            if(prev[i][0] === left && prev[i][1] === right){
                return prev
            }
        }
        prev.push([left,right])
        return prev
    }, []).length
};

//Andrews refactor
const numSpecialEquivGroups = A => {
    const s = new Set();
    A.forEach(a => {
      const odd = [];
      const even = [];
      for (let i = 0; i < a.length; i++) {
        i % 2 ? odd.push(a[i]) : even.push(a[i]);
      }
      odd.sort();
      even.sort();
      s.add(`${[...odd, ...even]}`);
    });
    return s.size;
  };