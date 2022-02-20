#!/usr/bin/env swift
import Foundation

// Combinatorial Enumeration AKA Exhaustive Search Problems

// Video notes:

/* Combinatorial Enumeration Binary Strings

	- Can be both permutation or combinations

If order matters use: permutation



*/

// Example 1:
// 
// Enumerate all possible binary strings of length 3
//
// 	ie, 000, 001, 010, 011, 100, 101, 110, 111
// 
//		Here the permutation allows repetition
//
//		 2	   2     2
//		———	X ——— X ——— 
//
//		since binary strings can only consist of 0, 1 each slot can only host 2 numbers, 0 & 1
//
//		2^3 = 8 possible strings
//


func bruteForce() { // Brutal for answer O(n^3)
	for i in 0 ... 1 {
		for j in 0 ... 1 {
			for k in 0 ... 1 {
				print(i, j, k)
			}
		}
	}
}

bruteForce()

// # Recursively - The above doesn't really work for lenght n, so how to do it recursively?

// Attempt 1: 

func allBinaryStrings(_ n: Int) -> [String] { // decrease and conquer method
	if n == 1 { return ["0", "1"]}

	let prev = allBinaryStrings(n - 1)
	var result: [String] = []

	for s in prev { // space complexity is O(2^n)
		result.append(s+"0")
		result.append(s+"1")
	}

	return result
}

print(allBinaryStrings(3))

// Attempt 2


// 	func allBinaryStrings2(_ n: Int, b: String) -> String { // divide and conquer method
// 		if n == 1 { print(["0", "1"]) }

// 		// let right = allBinaryStrings2(n-1) b: "1")
// 		let result = allBinaryStrings2(n-1, b: b)
// 		return  result + b
// 	}

// 	allBinaryStrings2(n-1, b: "1")
// 	allBinaryStrings2(n-1, b: "0")
// }
// helper(3)


// Think in partional solutions. The base case will be final result to print

func allBinaryStrings2(_ n: Int) {

	func bsHelper(_ slate: String, _ n: Int) { // O(2^n * n) ~ O(2^n)
		if n == 0 { print(slate); return } // base case & DFS

		// resursive case
		// two halves
		bsHelper(slate+"0", n-1)
		bsHelper(slate+"1", n-1)

	}

	bsHelper("", n)
}

allBinaryStrings2(3)

/// Takeaways

// DFS > BFS
// why?
// DFS only worries about one path at at time allowing for O(n) space complexity 
// while BFS stores a bunch of elements in memory as it completes the recursvie call