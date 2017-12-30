//Find the only element in an array that only occurs once. 
let data = [1,5,3,2,5,5,1,2,2,2,1,4,3];

(function onlyElementOnlyOnce(arr){
    //nlogn
    let temp = [...arr].sort();
    let sortCheck = arr => {
        let i;
        for(i = 0; i < temp.length; i++){
            if(temp[i] !== temp[i-1] && temp[i] !== temp[i+1])
                return temp[i];
        }
    }
    console.log(`iteratively ${sortCheck(temp)} is the element that occurs only once.`);

    // O(n)
    let unsortedCheck = arr => {
        let jsHashTable = arr.reduce(
            (acc, curr) => acc.get(curr) > 0 ? acc.set(curr, 2) : acc.set(curr, 1)
            , new Map()
        );
        let jsHashTableIter = jsHashTable.entries();
        for (let pair of jsHashTableIter) {
            if(pair[1] === 1)
                return pair[0];
        }
        return undefined;
    }

    console.log(`with a hash ${unsortedCheck(arr)} is the element that occurs only once.`);
})(data);