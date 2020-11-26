//Implement quick sort O(n^2)

let data = [20, 12, 10, 15, 2, 64, 25, 12, 22, 11];

let quickSort = (arr, lowestEl, highestEl) => {
    if(lowestEl < highestEl){
        let pivot = arr[highestEl];
        let wall = lowestEl - 1;
        let start;
        for(start = lowestEl; start < highestEl; start++) {
            if(arr[start] <= pivot){
                wall++;
                console.log(`swapping ${arr[wall]} with ${arr[start]}`);
                let temp = arr[wall];
                arr[wall] = arr[start];
                arr[start] = temp;
            }
        }
        
        console.log(`current wall value: ${wall + 1} and pivot of ${arr[highestEl]}`);
        wall++;
        console.log(`closing out swapping ${arr[wall]} with ${arr[highestEl]}`);
        let temp = arr[wall];
        arr[wall] = arr[highestEl];
        arr[highestEl] = temp;
        
        quickSort(arr, lowestEl, wall-1);
        quickSort(arr, wall+1, highestEl);   
    }
}
console.log(`before: ${data}`);
quickSort(data, 0, data.length-1);
console.log(`output: ${data}`);
