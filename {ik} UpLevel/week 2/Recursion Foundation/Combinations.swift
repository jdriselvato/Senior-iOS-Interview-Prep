// Combinations

// Read more: https://en.wikipedia.org/wiki/Choice_function

// My understanding:
//
// Number of ways to pick k objects out of n, where repitition is not allowed and order is not important.
//
//		notation: c(n,k) c = choice
//
//		c(n, n) = c(10, 10) = {1...10} = 1 subset because we are only returning n
//		c(n, 0)	= c(10, 0) = {} = 1 subset because of the empty subset
//		c(n, 1) = c(10, 1) = {10}, {9}, .... {1} = 10 or n
//		c(n, k) = c(n, n-k) // to see which elements are not in a set it doesn't matter it'll equal the same
//
// Examples:
// 
// 		`n` students in a class and need to form a committee `k` students out of those `n`. How may different ways to form such committee?
//

// returns the number of combinations of k in n
func choice(_ n: Int, _ k: Int) -> Int {
	if k == 0 || k == n { return 1 }

	return choice(n-1, k-1) + choice(n-1,k)
}

print("n = 4 | k = 2 | # of committees =", choice(4, 2))

/*
n = 4 | k = 2

4 student how many k committees are possible?
(a,b,c,d)

{a,b}, {a,c}, {a,d}
{b,c}, {b,d}
{c,d}

= 6 different committees
*/

print("n = 3 | k = 2 | # of committees =", choice(3, 2))


// Example 2:
//
// Say we have a weiqi 9x9 game, how many combination of moves are possible at the second turn?
// 		n = 81 because  9x9 & k = 2 for second move
// 
print("n = 81 | k = 2 | # of committees =", choice(81, 2))
