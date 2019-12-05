//nothing to see heres
let fs = require('fs');

let out = fs.readFileSync(`${__dirname}/random.txt`, 'utf8')
    .trim()
    .split('\n')
    .map(line => line.split("    "))
    .reduce((cart, purchase) => {
        cart[purchase[0]] = cart[purchase[0]] || [];
        cart[purchase[0]].push({
            quantity: purchase[1],
            item: purchase[2],
            cost: purchase[3]
        })
        return cart;
    },{});

console.log(out)

//Random way to check for bad words!
let str = "fudge"
let censoredList = ['cycles']
let res = str.replace(/\W/g, ' ').split(' ').filter(val => !!~censoredList.indexOf(val));

console.log(res)

let bleh = [1,5,3,67,3,4,5,61,4,2,3]
            .map(val => val * 3)
            .filter(val => val % 2 === 0 )
            .reduce((prev, curr) => prev + curr, 0)

console.log(bleh)

var arr1 = [1, 2, 3, 4];

//arr1.flatMap(x => [x * 2]);
// is equivalent to
arr1.reduce((acc, x) => acc.concat([x * 2]), []);
// [2, 4, 6, 8]