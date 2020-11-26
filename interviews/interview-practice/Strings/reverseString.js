//Reverse a String iteratively and recursively

const cheezeReverse = str => str.split('').reverse().join('');
console.log(`cheeky mike neas -> ${cheezeReverse('mike neas')}`);

const iterativeReverse = str => {
    let i;
    let output = '';
    for(i = str.length-1; i >= 0; i--){
        output += str.charAt(i);
    }
    return output;
}
console.log(`iteratively mike neas -> ${iterativeReverse('mike neas')}`);

const recursiveReverse = str => str.length === 0 ? str : recursiveReverse(str.substr(1)) + str.charAt(0);
console.log(`recursively mike neas -> ${recursiveReverse('mike neas')}`);

const rightReduceReverse = str => str.split('').reduceRight((acc, curr) => acc += curr, '');
console.log(`right reduce reverse mike neas -> ${rightReduceReverse('mike neas')}`);