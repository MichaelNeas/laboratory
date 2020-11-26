//Implement insertion sort O(n^2)

let data = [20, 12, 10, 15, 2, 64, 25, 12, 22, 11];

let insertionSort = arr => {
    console.log('original %s', arr);
    arr = [...arr];
    let i;
    for(i=1;i<arr.length;i++){
        j = i;
        while(arr[j] < arr[j-1] && j > 0){
            console.log(`swapping ${arr[j]} with ${arr[j-1]}`)
            let temp = arr[j];
            arr[j] = arr[j-1];
            arr[j-1] = temp;
            j--;
        }
        console.log(`now ${arr[j-1]} was inserted in order from ${arr}`);
    }
    return arr;
}

insertionSort(data);