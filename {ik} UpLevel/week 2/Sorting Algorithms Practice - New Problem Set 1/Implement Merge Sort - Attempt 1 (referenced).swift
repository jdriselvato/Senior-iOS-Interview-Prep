// Implement Merge Sort

/* Given a list of numbers, sort it using the Merge Sort algorithm.

Example:

{
"arr": [5, 8, 3, 9, 4, 1, 7]
}
Output: [1, 3, 4, 5, 7, 8, 9]

Notes

Constraints:

1 <= length of the given list <= 105
-109 <= number in the list <= 109
*/

func merge_sort(arr: [Int]) -> [Int] {
	var temp = arr
	
	helper(temp: &temp, start: 0, end: arr.count-1)

    return temp
}

func helper(temp: inout [Int], start: Int, end: Int) {
	if start == end { return } // single element is already sorted

	let mid = Int((end+start)/2) // mid of array

	helper(temp: &temp, start: start, end: mid)
	helper(temp: &temp, start: mid+1, end: end)

	var i = start
	var j = mid+1

	var aux = [Int]()

	// sort i vs j
	while i <= mid && j <= end {
		if temp[i] <= temp[j] {
			aux.append(temp[i])
			i += 1
		} else {
			aux.append(temp[j])
			j += 1
		}
	}

	// gather stage

	if i <= mid {
		aux.append(contentsOf: temp[i ... mid])
	}

	if j <= end {
		aux.append(contentsOf: temp[j ... end])
	}

	for index in 0 ... aux.count - 1{
        temp[start + index] = aux[index] 
    }

}

let sort = merge_sort(arr: [4,20,12,30,390,3,-1,-3])
print(sort)