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

/** way better not me originally
 * I had thought to use bitwise originally but didn't dive into it to this extent
 * @param {number} x
 * @param {number} y
 * @return {number}
 */
var hammingDistance = function(x, y) {
    let ones = 0;
    // xor the nums 1011 ^ 1000 = 11... 11 ^ 8 = 3 
    let z = x ^ y;
      
    while (z) {
        //compare lsb with 1 
        if (z & 1) ones += 1;  
        
        // shift the lsb off
        z = z >> 1;
    }
    
    return ones;
  };