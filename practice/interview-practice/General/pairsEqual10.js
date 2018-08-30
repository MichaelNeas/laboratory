//Find pairs in an integer array whose sum is equal to 10
let data = [1,2,3,4,5,6,7,8,9];

(function pairsEqualTen(data){
    console.log('Using brute force we find \n When:');
    let i,j;
    for(i=0; i<data.length; i++){
        for(j=i+1; j<data.length; j++){
            if(data[i] + data[j] === 10)
                console.log(`${data[i]} and ${data[j]} are combined we make 10`);
        }
    }

    console.log('And with O(n):');
    let ans = data.reduce((acc,curr,i) => {
        acc[curr] = i;
        return acc
    },{});

    console.log(JSON.stringify(ans))
    data.forEach((val,i,arr)=>{
        if(ans[10-val] != i){
            console.log(val + ' + ' + (10-val) + ' = 10'); 
        }
    })
    
})(data);