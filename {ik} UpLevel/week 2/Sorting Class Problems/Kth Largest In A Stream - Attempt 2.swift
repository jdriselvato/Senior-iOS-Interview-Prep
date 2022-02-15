// Kth Largest In A Stream

// Given an initial list along with another list of numbers to be appended with the initial list and an integer k, 
// return an array consisting of the k-th largest element after adding each element from the first list to the second list.

/* Example

{
"k": 2,
"initial_stream": [4, 6],
"append_stream": [5, 2, 20]
}
Output:

[5, 5, 6]
*/

// Attempt 2 needs to be more efficient than o(n^2logn) 
// Since the most efficient sorting is O(nlogn) we need to append the two streams and sort by pointers, I suspect.

func kth_largest(k: Int, initial_stream: [Int], append_stream: [Int]) -> [Int] {
    // merge two arrays together by one element at a time & return the second largest number

    var array = initial_stream
    for i in (0 ... array.count/2).reversed() {
        heapify(&array, i: i)
    }

    var kLargest: [Int] = []

    for num in append_stream {
        if array.count > k {
            array = array.suffix(k+1)
        }
        insert(&array, value: num)
        let kLargestNum = array[array.count - k]
        print(array, "|", kLargestNum)
        kLargest.append(kLargestNum)
    }

    return kLargest
}


func insert(_ array: inout [Int], value: Int) {
    array.append(value)
    for i in (0 ... array.count/2).reversed() {
        heapify(&array, i: i)
    }
}

// Returns a max heap array
// i is the parent
func heapify(_ array: inout [Int], i: Int) {
    let left = 2 * i // left node
    let right = 2 * i + 1 // right node
    var min = 0
    
    // check if a[left] is larger than a[i]
    if left <= array.count-1 && array[left] < array[i] {
        min = left
    } else {
        min = i
    }
    
    //    check if a[right] is larger than a[max]
    if right <= array.count-1 && array[right] < array[min] {
        min = right
    }
    
    if min != i { // if i (parent) is not the max swap
        array.swapAt(i, min)
        heapify(&array, i: min)
    } else if min == i && left <= array.count-1 && right <= array.count-1 && array[left] > array[right] {
        array.swapAt(left, right)
    }
}

let k = kth_largest
let initial_stream = kth_largest
let append_stream = kth_largest

let largestArray = kth_largest(k: k, initial_stream: initial_stream, append_stream: append_stream)
print(largestArray)
