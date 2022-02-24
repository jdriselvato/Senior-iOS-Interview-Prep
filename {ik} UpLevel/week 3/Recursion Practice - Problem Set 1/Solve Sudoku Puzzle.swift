// Solve Sudoku Puzzle

// Given a partially filled two-dimensional array, fill all the unfilled cells such that each row, each column and each 3 x 3 subgrid (as highlighted below by bolder lines) has every digit from 1 to 9 exactly once.

// Unfilled cells have a value of 0 on the given board.

// Example

// Example one

// {
// "board": [
// [8, 4, 9, 0, 0, 3, 5, 7, 0],
// [0, 1, 0, 0, 0, 0, 0, 0, 0],
// [7, 0, 0, 0, 9, 0, 0, 8, 3],
// [0, 0, 0, 9, 4, 6, 7, 0, 0],
// [0, 8, 0, 0, 5, 0, 0, 4, 0],
// [0, 0, 6, 8, 7, 2, 0, 0, 0],
// [5, 7, 0, 0, 1, 0, 0, 0, 4],
// [0, 0, 0, 0, 0, 0, 0, 1, 0],
// [0, 2, 1, 7, 0, 0, 8, 6, 5]
// ]
// }
// Output:

// [
// [8, 4, 9, 1, 6, 3, 5, 7, 2],
// [3, 1, 5, 2, 8, 7, 4, 9, 6],
// [7, 6, 2, 4, 9, 5, 1, 8, 3],
// [1, 5, 3, 9, 4, 6, 7, 2, 8],
// [2, 8, 7, 3, 5, 1, 6, 4, 9],
// [4, 9, 6, 8, 7, 2, 3, 5, 1],
// [5, 7, 8, 6, 1, 9, 2, 3, 4],
// [6, 3, 4, 5, 2, 8, 9, 1, 7],
// [9, 2, 1, 7, 3, 4, 8, 6, 5]
// ]
// Notes

// You can assume that any given puzzle will have exactly one solution.

// Constraints:

// Size of the input array is exactly 9 x 9
// 0 <= value in the input array <= 9

// 1. go row by row and find possible choices for the unfilled areas

// 2. after every unfilled spot in the entire pizzle has choices, 


func solve_sudoku_puzzle(board: [[Int]]) -> [[Int]] {
	var board: [[Int]] = board

	func solve(_ board: inout [[Int]]) -> Bool {
        for i in 0..<9 { // i is the row
            for j in 0..<9 { // j is the column
                if board[i][j] == 0 { // if row at column is 0 means we need an aswer
                    for k in 1 ... 9 { // all the choices
                        if valid(board, i, j, k) { // validate the board with k
                            board[i][j] = k // valid board mean assign k at i,j the new value
                            if solve(&board) {
                            	return true
                            }
                            board[i][j] = 0
                        }
                    }
                    print(board[i])
                    return false
                }
            }
        }
        return true
    }
    
    func valid(_ board: [[Int]], _ i: Int, _ j: Int, _ k: Int) -> Bool {
    	for m in 0..<9 {

        	// check if current row or column has k already
        	if board[i][m] == k || board[m][j] == k {
                return false // this row or column already has a k
            }
            
            // check 3x3 block has k
            let rowIndex: Int = ((i / 3) * 3) + (m / 3)
            let colIndex: Int = ((j / 3) * 3) + (m % 3)

            if board[rowIndex][colIndex] == k {
            	return false // this 3x3 already has a k
            }
        }

        return true
    }
    
    _ = solve(&board)
    return board
}

var board: [[Int]] = [
[8, 4, 9, 0, 0, 3, 5, 7, 0],
[0, 1, 0, 0, 0, 0, 0, 0, 0],
[7, 0, 0, 0, 9, 0, 0, 8, 3],
[0, 0, 0, 9, 4, 6, 7, 0, 0],
[0, 8, 0, 0, 5, 0, 0, 4, 0],
[0, 0, 6, 8, 7, 2, 0, 0, 0],
[5, 7, 0, 0, 1, 0, 0, 0, 4],
[0, 0, 0, 0, 0, 0, 0, 1, 0],
[0, 2, 1, 7, 0, 0, 8, 6, 5]
]

let solution: [[Int]] =  [
[8, 4, 9, 1, 6, 3, 5, 7, 2],
[3, 1, 5, 2, 8, 7, 4, 9, 6],
[7, 6, 2, 4, 9, 5, 1, 8, 3],
[1, 5, 3, 9, 4, 6, 7, 2, 8],
[2, 8, 7, 3, 5, 1, 6, 4, 9],
[4, 9, 6, 8, 7, 2, 3, 5, 1],
[5, 7, 8, 6, 1, 9, 2, 3, 4],
[6, 3, 4, 5, 2, 8, 9, 1, 7],
[9, 2, 1, 7, 3, 4, 8, 6, 5]
]

let solved = solve_sudoku_puzzle(board: board)
print("Correct:", solved == solution)

