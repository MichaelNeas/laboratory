/**
 * Suppose you have a long flowerbed in which some of the plots are planted and some are not. However, flowers cannot be planted in adjacent plots - they would compete for water and both would die.
 * Given a flowerbed (represented as an array containing 0 and 1, where 0 means empty and 1 means not empty), and a number n, return if n new flowers can be planted in it without violating the no-adjacent-flowers rule.
 * @param {number[]} flowerbed
 * @param {number} n
 * @return {boolean}
 */
var canPlaceFlowers = function(flowerbed, n) {
    let count = 0
    for(let i=0;i<flowerbed.length;i++){
        if(flowerbed[i] === 0 && (flowerbed[i+1] === undefined || flowerbed[i+1] === 0) && (flowerbed[i-1] === undefined || flowerbed[i-1] === 0)){
            flowerbed[i] = 1
            count++
        }
    }
    return count >= n
};