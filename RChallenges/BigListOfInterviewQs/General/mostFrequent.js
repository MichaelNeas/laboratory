//find the most frequent int in an array 
let data = [1,2,3,4,5,6,7,8,5,6,8,6,4,3,43,5,5,3,567,7,4,234,4,23,43,43,3,2,2,45,3,4];

let ans = data.reduce((acc, curr) => {
    acc[curr] > 0 ? acc[curr] += 1 : acc[curr] = 1;
    return acc;
},{});

console.log('The count of the data looks like, ' + JSON.stringify(ans))

let sortable = [];
for (let count in ans) {
    sortable.push([count, ans[count]]);
}
sortable.sort((a, b) => b[1] - a[1]);
console.log(sortable[0][0] + ' is the most frequent with ' + sortable[0][1] + ' occurances.');

console.log('or we find it in place with')
let ans2 = Object.keys(ans).sort((a,b)=>ans[b]-ans[a]);
console.log(JSON.stringify(ans2[0]))


//use Map, new Map()