// Fibonacci Sequence video notes

// The Book of Count or Liber Abaci by Leonado of Pisa
//		A book explaining the virtus of the arabic number system

// Fibonacci Sequence
//
// The Rabbit problem:
// 		How many pairs of rabbits can be produced from that pair in a year, if the nature of these rabbits is such that every month, each pair produces a new pair which from the second month on becomes productive?
// 		Rabbits never die
//
//		Days:		-	 0    1    2    3    4    5    6     7
//		Bunnies:	0 -> 1 -> 1 -> 2 -> 3 -> 5 -> 8 -> 13 -> 21 * 2

// How many rabbits at nth month?

func fibInterative(_ n: Int) -> Int { // interative O(n)
	var rabbits = 1
	var previousRabbits = 0

	var index = 0
	while index < n {

		let count = rabbits + previousRabbits
		previousRabbits = rabbits
		rabbits = count

		index += 1
	}

	return rabbits
}

// print("Number of rabbits:", fibInterative(5))


// How many rabbits at nth month?

func fib(_ n: Int) -> Int { // recursive
	if n == 0 || n == 1 { return 1 }

	return (fib(n-1) + fib(n-2))
}

print("Number of rabbits:", fib(4))


// Additive Sequence version of Fibonacci

func addSeq(_ n: Int, a: Int, b: Int) -> Int { // O(n)
	if n == 0 {
		return a
	}

	return addSeq(n-1, a: b, b: a+b)

}

print("Number of rabbits:", addSeq(6, a: 1, b: 1)) // the two base cases of 0 and 1 because 0, 1, 1, 2, etc
