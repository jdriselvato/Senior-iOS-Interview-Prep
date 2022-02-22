// Generate All Combinations With Sum Equal To Target

/* Given an integer array, generate all the unique combinations of the array numbers that sum up to a given target value.

Example One

{
"arr": [1, 2, 3],
"target": 3
}
Output:

[
[3],
[1, 2]
]

# Example Two

	{
	"arr": [1, 1, 1, 1],
	"target": 2
	}

Output:

	[
	[1, 1]
	]

Notes

-Each number in the array can be used exactly once.
-All the returned combinations must be different. Two combinations are considered different if their sorted version is different.
-The order of combinations and the order of the numbers inside a combination does not matter.
*/

func allCombos(_ array: [Int], currentSum: Int, targetSum: Int, slate: inout [Int], result: inout [[Int]]) {
	// backtracking
	if currentSum > targetSum {
		return
	}

	// base case
	if currentSum == targetSum {
		result.append(slate) // the numbers that equaled the sum
		return
	}

	// choices
	slate.append(array[0])
	allCombos(
		Array(array[1 ... array.count-1]), 
		currentSum: currentSum + array[0], 
		targetSum: targetSum, 
		slate: &slate, 
		result: &result
	)
	slate.removeLast()
}

var result: [[Int]] = []
var slate: [Int] = []

allCombos([1,2,3], currentSum: 0, targetSum: 3, slate: &slate, result: &result)

print(result)

/// Maybe use this?
/*
for i in 0 ..< array.count { // 3 times cause we make 3 choice
	slate.append(array[i])
	// What kind of array are we passing to perms
	// since slate already has i, we want to pass everything but i
	perms(Array(array.suffix(from:i+1)), slate: &slate)
	slate.removeLast()
}
*