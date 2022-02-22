// Permute Array Of Unique Integers

/* Given an array of unique numbers, return in any order all its permutations.

Example

{
"arr": [1, 2, 3]
}

Output:

[
[1, 2, 3],
[1, 3, 2],
[2, 1, 3],
[2, 3, 1],
[3, 2, 1],
[3, 1, 2]
]

Notes

Constraints:

1 <= size of the input array <= 9
0 <= any array element <= 99
*/

// Questions to ask:
// What is the number of blocks? 3
// What are the number of choices? 3; 1, 2, 3



func get_permutations(arr: [Int]) -> [[Int]] {
	if arr.isEmpty { return [] }

    var slate: [Int] = []
    var result: [[Int]] = []

    perms(arr, slate: &slate, result: &result)

    return result
}

func perms(_ array: [Int], slate: inout [Int], result: inout [[Int]]) {
	// base case
	if array.isEmpty {
		result.append(slate)
		return
	}

	// choices

	for i in 0 ..< array.count { // 3 times cause we make 3 choice
		slate.append(array[i])

		let leftOfI = Array(array.prefix(i))
		let rightOfI = Array(array.suffix(from:i+1))
		let noI = leftOfI + rightOfI
		// What kind of array are we passing to perms
		// since slate already has i, we want to pass everything but i
		perms(noI, slate: &slate, result: &result)
		slate.removeLast()
	}
}

print(get_permutations(arr: [1,2,3]))


// Q: What is my hold up? When to use a for in loop.
//		A: Use it when looping through choices. In this example we had 3 choices.

// Q: I keep getting confused on how to deal with slate after the appending but
// 		A: because we do sandwiching, we remove it afterwards.

// Q: Why didn't a for loop with `perms(Array(array.suffix(from:i+1)), slate: &slate)`
//		A: Because we pass only i+1 not before i as well.

// Q: What is a permutation?
//		A: A algo that returns all possible combinatinos for a given block size