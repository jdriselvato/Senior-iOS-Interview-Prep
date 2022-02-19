// Recursive Mathematical Functions

// Notes from video

/* My understanding of it

	There are two types:
		- permutation: elements can not repeat
		- Arrangement: elements are allowed to repeat

*/

// MARK: - Find the factorial of n aka (n)!

// resursive verion
func fact(_ n: Int) -> Int {  // 
	if n == 0 { return 1 } // (0)! = 1

	return n * fact(n - 1) // n * (n-1)!
}

print(10, "Factorial:", fact(10))

// Iterative
func fact2(_ n: Int) -> Int { // O(n)
	var result = 1
	for i in 1 ... n {
		result = result * i
	}
	return result
}

print(10, "Factorial:", fact2(10))
