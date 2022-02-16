// Merge One Sorted Array Into Another

/*First array has n positive numbers, and they are sorted in the non-descending order.

Second array has 2n numbers: first n are also positive and sorted in the same way but the last n are all zeroes.

Merge the first array into the second and return the latter. You should get 2n positive integers sorted in the non-descending order.

Example:

{
"first": [1, 3, 5],
"second": [2, 4, 6, 0, 0, 0]
}

Output: [1, 2, 3, 4, 5, 6]

Notes

Constraints:

1 <= n <= 105
1 <= array elements (except those zeroes) <= 2 * 109
You can use only constant auxiliary space
*/



func merge_one_into_another(first: [Int], second: [Int]) -> [Int] {
    
    var result = (first + second).filter({$0 != 0})
    
    helper(array: &result, start: 0, end: result.count-1)
    
    return result
}

func helper(array: inout [Int], start: Int, end: Int) {
    if start == end { return }
    
    let mid = Int((end+start)/2)
    
    helper(array: &array, start: start, end: mid)
    helper(array: &array, start: mid+1, end: end)
    
    var i = start
    var j = mid+1
    
    var aux: [Int] = []
    
    while i <= mid && j <= end {
        if array[i] <= array[j] {
            aux.append(array[i])
            i += 1
        } else {
            aux.append(array[j])
            j += 1
        }
    }
    
    // gather
    
    if i <= mid {
        aux.append(contentsOf: array[i ... mid])
    }
    
    if j <= end {
        aux.append(contentsOf: array[j ... end])
    }
    
    for i in 0 ... aux.count-1 {
        array[start+i] = aux[i]
    }
}

/// Problem with this one is we already split the array at the start. Why not combine and split right after? you shouldn't.
