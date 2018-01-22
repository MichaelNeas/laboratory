//Implement bubble sort

let data = [3, 7, 2, 4, 1, 9, 8, 5];

let bubbleSort = arr => {
    arr = [...arr]
    let swapped = true;
    while(swapped){
        let i;
        swapped = false;
        for(i = 0; i < arr.length - 1 ; i++){
            if(arr[i] > arr[i+1]){
                let temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
                swapped = true;
            }
            console.log(arr)
        }
    }
    return arr;
}

let optimizedBubbs = arr => {
    arr = [...arr]
    let swapped = true;
    let checkBoundary = arr.length - 1;
    while(swapped){
        swapped = false;
        let i;
        for(i = 0; i < checkBoundary ; i++){
            if(arr[i] > arr[i+1]){
                let temp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = temp;
                swapped = true;
            }
            console.log(arr)
        }
        checkBoundary--;
    }
    return arr;
}

bubbleSort(data);
console.log('------------optimizations------------');
optimizedBubbs(data);