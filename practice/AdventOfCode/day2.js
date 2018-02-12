/*  5 1 9 5
    7 5 3
    2 4 6 8
    The first row's largest and smallest values are 9 and 1, and their difference is 8.
    The second row's largest and smallest values are 7 and 3, and their difference is 4.
    The third row's difference is 6.
    8 + 4 + 6 = 18. is the check sum
*/
const fs = require('fs');
const path = require('path');

const pathToData = path.join(__dirname, 'data', 'day2.txt');

const lineReader = require('readline').createInterface({
    input: fs.createReadStream(pathToData)
});
(function getValues(){
    return new Promise(resolve => {
        let checksum = 0;
        lineReader.on('line', line => {
            let row = line.split('\t').map(val => Number(val))
            let max = min = row[0];
            row.forEach(element => {
                if(element > max) max = element;
                if(element < min) min = element;
            });
            checksum += max - min;
        });
        resolve(checksum)
    });
})().then(res => console.log(`File read and this is the check sum: ${res}`)).catch(e => console.log(e))


