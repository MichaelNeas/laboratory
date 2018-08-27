/**
 * The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
 * @param {number} x
 * @param {number} y
 * @return {number}
 */
var hammingDistance = function(x, y) {
    x = (+x).toString(2)
    y = (+y).toString(2)
    let padd = ''
    let diff = x.length - y.length
    if(diff > 0){
        padd = x.substring(0, diff)
        x = x.substring(diff, x.length)
    } else if (diff < 0) {
        padd = y.substring(0, Math.abs(diff))
        y = y.substring(Math.abs(diff), y.length)
    }
    let count = padd.replace(/0/g,'').length
    for(let i=0; i<y.length; i++){
        if(y[i] ^ x[i]){
            count++
        }
    }
    return count
};

/** way better not me
 * @param {number} x
 * @param {number} y
 * @return {number}
 */
var hammingDistance = function(x, y) {
    let ones = 0;
    let z = x ^ y;
      
    while (z) {
      if (z & 1) {
        ones += 1;  
      }
      // bit shift right 1 each time
      z = z >> 1;
    }
    
    return ones;
  };