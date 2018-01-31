// Implement selection sort O(n2)

let data = [20, 12, 10, 15, 2, 64, 25, 12, 22, 11];

let selectionSort = arr => {
    console.log('original %s', arr);
    arr = [...arr];
    let i,j;
    for(i=0;i<arr.length;i++){
        let min = i;
        for(j=i+1;j<arr.length;j++){
            if(arr[min] > arr[j]) min = j
        }
        let temp = arr[min];
        arr[min] = arr[i];
        arr[i] = temp;
        console.log(`now ${temp} was minimum from ${arr}`);
    }
    return arr;
}

selectionSort(data);