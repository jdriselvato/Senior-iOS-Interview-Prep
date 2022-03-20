// # Cut The Rope
/*
Given a rope, cut it into parts maximizing the product of their lengths.

## Example
```
{
"n": 4
}
```

Output: `4`

Length of the rope is 4.
All ways it can be cut into parts: 1+3, 1+1+2, 1+1+1+1, 2+2, 2+1+1.
Among these, 2+2 cut makes for the greatest product: 2*2=4.

## Notes

Return an integer which equals to the maximum possible product of the given rope’s parts.
Constraints:

2 <= length of the rope <= 94
You have to cut at least once.
Length of the rope, lengths of all parts are all positive integers.
*/

func max_product_from_cut_pieces(n: Int) -> Int {
	var bestSolution = Array(repeating: 0, count: n+1)

	for l in 1...n { // l = length
		for c in 1..<l { // c = cut
			bestSolution[l] = max(
				bestSolution[l], 
				max(c*(l-c), c*bestSolution[l-c])
			)
		} 
	}

	return bestSolution[n]
}


/*
Rope length = l

for every possible cut (of length c), compute:
	- stop cutting: c*(l-c)
	- keep cutting: best(l-c)

formula:
	
	bestSolution(l) = max(c*(l-c), c*bestSolution(l-c))

calculate from 1 <= c < l 
*/