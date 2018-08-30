const data = require('./athlete-data.js').streams;
const assert = require('assert');
/*
* Callback function for reducing the data
* @param {acc} - accumulator of ascentions through the exercise
* @param curr - elevation number
* @param i - index of the iteration
* @param arr - original array called on the reduce
*/
const separateIndexPairs = (acc, curr, i, arr) => {
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

/*
* Return all the given tuples where the athlete is increasing elevation
* Where we want the valley and the peak returned in each tuple
* IIFE for passing the data
*/
const res = (elevationChange = data => 
    data.elevation.reduce(separateIndexPairs, {pairs:[], temp:[]})
)(data);

//console.log(res) //uncomment me to see the final results
assert.deepEqual(res.pairs[0],{ low: 1, high: 4 }, "First time athlete ascends is off");
assert.deepEqual(res.pairs[1],{ low: 5, high: 7 }, "Second time athlete assends is off");
