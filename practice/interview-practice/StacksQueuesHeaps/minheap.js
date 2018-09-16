let MinimumHeap = () => {
    let minHeap = []
    let currentSize = 0
    
    let getLeftChildIndex = parentIndex => 2 * parentIndex + 1
    let getRightChildIndex = parentIndex => 2 * parentIndex + 2
    let getParantIndex = childIndex => Math.ceil((childIndex-1)/2)

    let hasLeftChild = index => getLeftChildIndex(index) < currentSize
    let hasRightChild = index => getRightChildIndex(index) < currentSize
    let hasParent = index => getParantIndex(index) >= 0

    let leftChild = index => minHeap[getLeftChildIndex(index)]
    let rightChild = index => minHeap[getRightChildIndex(index)]
    let parent = index => minHeap[getParantIndex(index)]

    let swapAtIndexes = (a,b) => {
        let temp = minHeap[a]
        minHeap[a] = minHeap[b]
        minHeap[b] = temp
    }

    let heapifyUp = () => {
        let index = currentSize - 1
        while(hasParent(index) && parent(index) > minHeap[index]){
            swapAtIndexes(getParantIndex(index), index)
            index = getParantIndex(index)
        }
    }
    let heapifyDown = () => {
        let index = 0
        while(hasLeftChild(index)){
            let smallerChildIndex = getLeftChildIndex(index)
            if(hasRightChild(index) && rightChild(index) < leftChild(index))
                smallerChildIndex = getRightChildIndex(index)
            if(minHeap[index] < minHeap[smallerChildIndex]) break
            else swapAtIndexes(index, smallerChildIndex)
            index = smallerChildIndex
        }
    }

    let insert = val => {
        minHeap[currentSize] = val
        currentSize++
        heapifyUp()
    }

    return {
        createHeap: array => {
            for(let i = 0; i < array.length; i++){
                insert(array[i])
            }
        },
        display: () => minHeap.forEach(val => console.log(` ${val}`)),
        getCurrentSize: () => currentSize,
        insert: val => insert(val),
        peak: () => minHeap[0],
        poll: () => {
            let top = minHeap[0]
            minHeap[0] = minHeap[currentSize - 1]
            currentSize--
            heapifyDown()
            return top
        }
    }
}

let miniHeap = MinimumHeap();
miniHeap.createHeap([6,4,2,5,7,13,6,8,4,1,3,43])
miniHeap.display()