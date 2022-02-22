/* N Choose K Combinations

Given two integers n and k, find all the possible  combinations of k numbers in range 1 to n.

Example One

{
"n": 5,
"k": 2
}
Output:

[
[1, 2],
[1, 3],
[1, 4],
[1, 5],
[2, 3],
[2, 4],
[2, 5],
[3, 4],
[3, 5],
[4, 5]
]
Example Two

{
"n": 6,
"k": 6
}
Output:

[
[1, 2, 3, 4, 5, 6]
]
Notes

The answer can be returned in any order.

Constraints:

1 <= n <= 20
1 <= k <= n
*/


// in the recursive call we only pass the remaining parts of an array

// block size = 2
// choices = n

// backtrack is if slate.count == k 

// base case is n <= 0

// arr[n-1] each iteration

// return a array of k element arrays

var result = [[Int]]()
func nk(_ n: Int, k: Int, cValue: Int, slate: inout [Int]) {
	// backtrack case
	if slate.count == k {
		result.append(slate)
		return
	}

	// base case
	if n < cValue {
		return
	}

	for i in cValue ... n {
		slate.append(i)
		nk(n, k: k, cValue: i+1, slate: &slate)
		slate.removeLast()
	} 
}

var temp: [Int] = []
nk(1, k: 1, cValue: 1, slate: &temp)
print(result)

// Walking through the steps as if it was a real interview led me to the answer without any real hang ups.