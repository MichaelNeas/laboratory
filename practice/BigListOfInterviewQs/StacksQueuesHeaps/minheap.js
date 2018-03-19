module.exports = function(){
    let minHeap = []
    let currentSize = 0
    return {
        createHeap: array => {
            if(array.length > 0){
                let i
                for(i = 0; i < array.length; i++){
                    this.insert(array[i])
                }
            }
        },
        display: () => minHeap.forEach(val => console.log(` ${val}`)),
        insert: val => {
            if(currentSize === capacity){
                console.log("heap is full")
                return
            }
            currentSize++
            minHeap[currentSize] = val
        }
    }
}