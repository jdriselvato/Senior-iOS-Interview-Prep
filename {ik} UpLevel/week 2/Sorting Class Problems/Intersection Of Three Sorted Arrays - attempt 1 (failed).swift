// Intersection Of Three Sorted Arrays

/* Given three arrays sorted in the ascending order, return their intersection sorted array in the ascending order.

Example One

{
"arr1": [2, 5, 10],
"arr2": [2, 3, 4, 10],
"arr3": [2, 4, 10]
}
Output: [2, 10]

Example Two

{
"arr1": [1, 2, 3],
"arr2": [],
"arr3": [2, 2]
}
Output: [-1]

Example Three

{
"arr1": [1, 2, 2, 2, 9],
"arr2": [1, 1, 2, 2],
"arr3": [1, 1, 1, 2, 2, 2]
}

Output: [1, 2, 2]

Notes

If the intersection is empty, return an array with one element -1.
Constraints:

0 <= length of each given array <= 105
0 <= any value in a given array <= 2 * 106
*/



func find_intersection(arr1: [Int], arr2: [Int], arr3: [Int]) -> [Int] {
    if arr1.isEmpty || arr2.isEmpty || arr3.isEmpty { return [-1] }
	var min = arr1.count // the min array size

	if min > arr2.count {
		min = arr2.count
	}
	if min > arr3.count {
		min = arr3.count
	}

	var max = arr1.count // the min array size

	if max < arr2.count {
		max = arr2.count
	}
	if max < arr3.count {
		max = arr3.count
	}

	print(max, min)

	var inter = [Int]()

	// check the pairs from the front
	for i in 0 ... min-1 {
		if arr1[i] == arr2[i] && arr2[i] == arr3[i] {
			inter.append(arr1[i])
		}
	}

	// check the pairs from the back 

	var outer = [Int]()
	for i in (0 ... max-1) {
		guard arr1.count-1-i >= 0 && arr2.count-1-i >= 0 && arr2.count-1-i >= 0 && i < min else { continue }
		print("min:", min, "i:", i, "a1:", arr1.count-1-i, "a2:", arr2.count-1-i, "a3:", arr3.count-1-i)

		if arr1[arr1.count-1-i] == arr2[arr2.count-1-i] && arr2[arr2.count-1-i] == arr3[arr3.count-1-i] {
			outer.insert(arr1[i], at: 0)
		}
	}

	let intersection = inter + outer

    return intersection.isEmpty ? [-1] : intersection
}

// Failed

// this doesn't really work because they'll get duplicates and this is obviously a brute force attempt which just feels lazy.