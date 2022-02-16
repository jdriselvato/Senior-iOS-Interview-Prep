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
	guard !arr1.isEmpty || !arr2.isEmpty || !arr3.isEmpty else { return [-1] }

	let combined = arr1 + arr2 + arr3

	var bucket = [Int](repeating: 0, count: 212) 

	for i in combined {
		bucket[i] = bucket[i] + 1
	}

	print(bucket.filter({ $0 != 0 }))

    return [-1]
}

let inter = find_intersection(arr1: [1, 2, 2, 2, 9], arr2: [1, 1, 2, 2], arr3: [1, 1, 1, 2, 2, 2])
print(inter)

// bucket attempt fails because any array can make it even dividing by 3