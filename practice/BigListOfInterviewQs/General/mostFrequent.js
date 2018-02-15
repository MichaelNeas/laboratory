const assert = require('assert');
//find the most frequent int in an arrays 
let data = [1,2,3,4,5,6,7,8,5,6,8,6,4,3,43,5,5,3,567,7,4,234,4,23,43,43,3,2,2,45,3,4];

(function mostFrequentInt(data){
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

    //in place answer
    let ans2 = Object.keys(ans).sort((a,b)=>ans[b]-ans[a]);
    console.log(JSON.stringify(ans2[0]))

    //using a Javascript Map
    let mapAns = data.reduce((acc, curr) => {
        acc.get(curr) > 0 ? acc.set(curr, acc.get(curr) + 1) : acc.set(curr, 1);
        return acc;
    },new Map());

    //store a persistent max
    let max = [0,0];
    let ans3 = mapAns.forEach((val, key, map) => {
        if(val > max[1])
            max = [key,val];
    })

    console.log(`Key, Value of most seen ${max}`);
})(data);