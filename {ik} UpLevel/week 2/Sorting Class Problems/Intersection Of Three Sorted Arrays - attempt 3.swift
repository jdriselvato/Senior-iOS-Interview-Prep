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

	var i = 0, j = 0, k = 0

	var result: [Int] = []

	while i < arr1.count && j < arr2.count && k < arr3.count {

		print("i:", i, arr1[i], "j:", j, arr2[j], "k:", k, arr3[k])
		if ((arr1[i] == arr2[j]) && (arr2[j] == arr3[k])) {
			result.append(arr1[i])
		}

		var minimum = min(arr1[i], arr2[j])
		minimum = min(minimum, arr3[k])

		if (minimum == arr1[i]) {
			print(minimum, "==", i)
			i += 1
		}
		if (minimum == arr2[j]) {
			print(minimum, "==", j)
			j += 1
		}
		if (minimum == arr3[k]) {
			print(minimum, "==", k)
			k += 1
		}

	}

    return result.isEmpty ? [-1] : result
}

let inter = find_intersection(arr1: [1, 2, 2, 2, 9], arr2: [1, 1, 2, 2], arr3: [1, 1, 1, 2, 2, 2])
print(inter)

// bucket attempt fails because any array can make it even dividing by 3