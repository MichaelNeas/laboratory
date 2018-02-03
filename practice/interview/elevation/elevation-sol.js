let data = require('./athlete-data.js').streams;

//  0   1  2  3  4   5   6
//[ 5, -3, 2, 5, 12, 10, 13 ]
let separateIndexPairs = (acc, curr, i, arr) => {
    if(acc.temp.length === 1){
        if(curr < arr[i-1]){
            acc.pairs.push({"low":acc.temp[0], "high":i-1});
            acc.temp = [];
        }else if(i === arr.length-1)
            acc.pairs.push({"low":acc.temp[0], "high":i});
    }
    if(acc.temp.length === 0 && curr < arr[i+1])
        acc.temp.push(i);
    return acc;
};

console.log((elevationChange = data => data.elevation.reduce(separateIndexPairs,{pairs:[], temp:[]}))(data));