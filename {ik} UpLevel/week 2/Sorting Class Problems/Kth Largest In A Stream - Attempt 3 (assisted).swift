import Foundation

// Binary Heap Operations & Heapsort - attempt 3

// In the student submission they do a min heap and limit the count in the heap to k. This wat they can "peek" or look at the top number and always get the largest in the stream.

func kth_largest(k: Int, initial_stream: [Int], append_stream: [Int]) -> [Int] {

    var minHeap = [Int]()

    // Create a min heap from initial_stream
    initial_stream.forEach { num in
        insert(&minHeap, value: num)
    }

    // if minHeap.count > k {
    //     minHeap.removeLast()
    // }

    print(minHeap)

    var result: [Int] = []

    // insert streaming numbers and create our array of kth largest in a stream
    append_stream.forEach { num in
        print(num, minHeap)
        // if num <= minHeap[k] { return } // no need to append cause it doesn't change the largest
        insert(&minHeap, value: num)

        // if minHeap.count > k {
        //     minHeap.removeLast()
        // }

        result.append(minHeap[k-1])
    }


    return result
}

// MARK: - Heap Code

/// Heap Insert
func insert(_ array: inout [Int], value: Int) {
    array.append(value)
    shiftUp(&array, index: array.count-1)
}

/// ShiftUp
func shiftUp(_ array: inout [Int], index: Int) {
    var childIndex = index
    let child = array[childIndex]
    var parent = parentIndex(ofIndex: childIndex)

    while childIndex > 0 && child < array[parent] { // < m
        array.swapAt(parent, childIndex)
        array.swapAt(leftChildIndex(ofIndex: parent), rightChildIndex(ofIndex: parent))
        childIndex = parent
        parent = parentIndex(ofIndex: childIndex)
    }
}

/// Helpers

func parentIndex(ofIndex i: Int) -> Int {
    return (i - 1) / 2
}
func leftChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 1
}
func rightChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 2
}

// MARK: - Testing

let initial = [4, 6, 5, 2, 20]
let appended = [5, 2, 20]
let k = 2

print("Sorted:  ", kth_largest(
    k: k, 
    initial_stream: initial, 
    append_stream: appended
    )
)

