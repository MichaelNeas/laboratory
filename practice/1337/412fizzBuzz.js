/**
 * @param {number} n
 * @return {string[]}
 */
var fizzBuzz = function(n) {
    let ans = []
    for(let i=1; i<n+1; i++){
        let str = ""
        if(i%3 === 0 || i%5===0){
            if(i%3 === 0)
                str += "Fizz"
            if(i%5 === 0)
                str += "Buzz"
        }else
            str += i
        ans.push(str)
    }
    return ans
};

// lol
var fizzBuzz = function(n) {
    var list = [];
    for (var k = 1; k <= n; k++) {
        var str = "";
        if (k % 3 == 0) str += "Fizz";
        if (k % 5 == 0) str += "Buzz";
        list.push(str || "" + k );
    }
    return list;
};