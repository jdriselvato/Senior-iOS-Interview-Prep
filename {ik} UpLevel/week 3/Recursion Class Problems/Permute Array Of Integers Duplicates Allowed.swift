/*Permute Array Of Integers Duplicates Allowed

Given an array of numbers with possible duplicates, return all of its permutations in any order.

Example

{
"arr": [1, 2, 2]
}
Output:

[
[1, 2, 2],
[2, 1, 2],
[2, 2, 1]
]
Notes

Constraints:

1 <= size of the input array <= 9
0 <= any array element <= 9
*/


// pass the array, an index, a slate, an arry of choices left

// the backtrack is if slate.count == arr.count and we append the slate to the result

// the base case is if index is > array.count we return

// cycle through the array storing current index in slate recursive with passing down choices left

// Time complexity == O(2^n)

// Space complexity == S(n)


func driver(arr: [Int]) -> [[Int]] {
	var result = [[Int]]()
	var slate: [Int] = []

	func perm(_ arr: [Int], index: Int, slate: inout [Int]) {
		// base case
		if index == arr.count {
			result.append(slate)
			return
		}

		// choices
		var tempArr = arr
		var originals = Set<Int>()

		for i in index ... arr.count-1 {
			if originals.contains(tempArr[i]) {
				continue
			}

			tempArr.swapAt(i, index)

			slate.append(tempArr[index])
			perm(tempArr, index: index+1, slate: &slate)
			slate.removeLast()

			tempArr.swapAt(index, i)

			originals.insert(tempArr[i])
		}
	}

	perm(arr, index: 0, slate: &slate)

	return result
}

print(driver(arr: [1, 2, 2]))

// The hang up, shuffling perms is a little confusing but reading the original question, I mistook `with possible duplicates` meaning the return array can contain duplicates. Which isn't true, hence the originals set.
