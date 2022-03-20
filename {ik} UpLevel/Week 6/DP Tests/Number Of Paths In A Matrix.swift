// # Number Of Paths In A Matrix

/*
Given a matrix n by m containing 0s and 1s, find the number of distinct paths from cell (0, 0) to cell (n - 1, m - 1) that

step on cells with 1s and
go only down or to the right.

**Return the number of paths modulo (109 + 7).**

## Example One:
```
	{
	"matrix": [
		[1, 1, 1, 1],
		[1, 1, 1, 1],
		[1, 1, 1, 1]
		]
	}
```

Output: `10`
*/

func number_of_paths(matrix: [[Int]]) -> Int {
    guard !matrix.isEmpty else { return 0 }
    let m = 100000
    
    var row = matrix.count
    var column = matrix[0].count
    
    var numPath = matrix
    numPath[0][0] = matrix[0][0] == 0 ? 0 : 1
    
    for r in 0..<row {
        for c in 0..<column {
            if matrix[r][c] == 0 || (r == 0 && c == 0) { continue }
            // formula
            numPath[r][c] = (c >= 1 ? numPath[r][c-1] : 0)%m + 
                (r >= 1 ? numPath[r-1][c] : 0)%m // start from top left
            
        }
    }
    
    return numPath[row-1][column-1]%m
}

let a = number_of_paths(matrix: [
    [1,1,1,1,0],
    [1,1,0,1,1],
    [1,1,0,0,1],
    [0,1,1,1,1],
])
print(a)

---

## What is recursion:

- solving a big problem by using the solutions to smaller problems of the same kind

## Only a hand full of ways turn big to small problem:
- if the input is a number, look at a smaller
- if a input is a list or string or sequence, look at less elements
- if a graph, get rid of a node 
- if it's a matrix, get rid of a column or a row

	[1, 1, 1, 1],
	[1, 1, 1, 1],
	[1, 1, 1, 1] 

into 

	[1, 0, 1, 1],
	[1, 1, 1, 1], <-- only one way

into

	[1, 1]
	[0, 1] <-- only one way

- Now we have solutions from the smaller problems


[1, 1, 1], <-- one way
[1, 0, 1],
[1, 1, 1] 		(2 ways)
 ^
 |_ another way

- Counting problems are almost always addition

---

## Two ways to approach the formula

r = row, c = column

numPath(r,c) = numPath(r, c-1) + numPath(r-1, c) // start from top left
		
		or

numPath(r,c) = numPath(r, c+1) + numPath(r+1, c) // start from bottom right

---

## How we have to think about the base cases:

row[0] = all 1 until there is a blocker then 0
column[0] = all 1 until there is a blocker then 0

---

## Remember this for modulus

((a%n) + (b%n))%n = (a+b)%n