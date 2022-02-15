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

func kth_largest(k: Int, initial_stream: [Int], append_stream: [Int]) -> [Int] {

    // merge two arrays together by one element at a time & return the second largest number
    var kLargest: [Int] = []
    
    var temp = initial_stream
    
    for num in append_stream {
        temp.append(num)
        temp = temp.sorted()
        kLargest.append(temp[temp.count-k]) // append second largest
    }
    
    return kLargest
}

// Passed 7 out 13 but then they had test that had like 100,000 elements and appending on those. So swift's `.sorted()` or O(nlogn) time limit exceeded

// Attempt 1: 7/13 but failed to be the most efficient