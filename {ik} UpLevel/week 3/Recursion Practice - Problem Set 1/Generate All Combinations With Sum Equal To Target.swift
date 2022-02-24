// Generate All Combinations With Sum Equal To Target

// Given an integer array, generate all the unique combinations of the array numbers that sum up to a given target value.

// Example One

// {
// "arr": [1, 2, 3],
// "target": 3
// }
// Output:

// [
// [3],
// [1, 2]
// ]

// Example Two

// {
// "arr": [1, 1, 1, 1],
// "target": 2
// }
// Output:

// [
// [1, 1]
// ]

// Notes

// Each number in the array can be used exactly once.
// All the returned combinations must be different. Two combinations are considered different if their sorted version is different.
// The order of combinations and the order of the numbers inside a combination does not matter.

// Constraints:

// 1 <= size of the input array <= 25
// 1 <= value in the array <= 100
// 1 <= target value <= 2500


func generate_all_combinations(arr: [Int], target: Int) -> [[Int]] {
	var result = [[Int]]()

	var slate = [Int]()
	var array = arr.sorted(by: >)

	func helper(arr: inout [Int], target: Int, index: Int, slate: inout [Int], currentSum: Int) {
		if currentSum == target && !result.contains(slate) {
			result.append(slate)
			return
		}

		// base case
		if index < 0 {
			return
		}

		// backtrack
		if arr[index] > target || currentSum > target {
			return
		}

		helper(arr: &arr, target: target, index: index-1, slate: &slate, currentSum: currentSum)

		slate.append(arr[index])
		let currentSum = currentSum + arr[index]
		helper(arr: &arr, target: target, index: index-1, slate: &slate, currentSum: currentSum)
		slate.removeLast()

	}

	helper(arr: &array, target: target, index: array.count-1, slate: &slate, currentSum: 0)

	return result
}

print(generate_all_combinations(arr: [42, 68, 35, 1, 70, 25, 79, 59, 63, 65, 6, 46, 82, 28, 62, 92, 96, 43, 28, 37, 92, 5, 3, 54, 93], target: 83))

// [[94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94]]
// [[94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94]]

let a = [
[37, 46],
[6, 35, 42],
[5, 35, 43],
[5, 6, 35, 37],
[3, 37, 43],
[3, 6, 28, 46],
[1, 82],
[1, 28, 54],
[1, 5, 35, 42],
[1, 5, 6, 28, 43],
[1, 5, 6, 25, 46],
[1, 3, 79],
[1, 3, 37, 42],
[1, 3, 25, 54],
[1, 3, 5, 28, 46],
[1, 3, 5, 6, 68],
[1, 3, 5, 6, 25, 43]
]
print("oof", a.count)

//