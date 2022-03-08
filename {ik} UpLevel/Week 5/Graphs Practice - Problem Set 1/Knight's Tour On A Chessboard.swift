// Knight's Tour On A Chessboard

/* You are given a chessboard with rows rows and cols columns and a knight - that moves like in normal chess - located at the start_row-th row and start_col-th column. The knight needs to reach the position at the end_row-th row and end_col-th column.
 
 Find minimum number of moves that knight needs to make to get from starting position to ending position.
 
 start_row, start_col, end_row and end_col are all zero-indexed.
 
 Example
 
 {
 "rows": 5,
 "cols": 5,
 "start_row": 0,
 "start_col": 0,
 "end_row": 4,
 "end_col": 1
 }
 Output:
 
 3
 
 3 moves to reach from (0, 0) to (4, 1):
 (0, 0) → (1, 2) → (3, 3) → (4, 1).
 
 Notes
 
 If it is not possible to reach from starting position to ending position, then return -1.
 Constraints:
 
 1 <= rows * cols <= 105
 0 <= start_row, end_row < rows
 0 <= start_col, end_col < cols
 */


typealias Coord = (Int, Int, Int) // i, j, move#

func find_minimum_number_of_moves(rows: Int, cols: Int, start_row: Int, start_col: Int, end_row: Int, end_col: Int) -> Int {
    if start_row == end_row && start_col == end_col { return 0 }
    
    // Do we need to build a graph? Yes, 'cause it's rows and cols
    var visited = Array(repeating: Array(repeating: -1, count: cols), count: rows)

    var numberOfMove = 0
    
    var queue = [(Coord)]()
    queue.append((start_row, start_col, 0))
    visited[start_row][start_col] = 1
    
    while !queue.isEmpty {
        guard let node = queue.first else { break }
        
        if node.0 == end_row && node.1 == end_col {
        	numberOfMove = node.2
            break
        }
        
        for move in getValidMoves(node.0, node.1, rows: rows, columns: cols, visited: visited) {
            
            
            if visited[move.0][move.1] == -1 {
                queue.append((move.0, move.1, node.2+1))
                visited[move.0][move.1] = 1
            }
        }
        queue.removeFirst()
    }
    
    return numberOfMove == 0 ? -1 : numberOfMove
}

func getValidMoves(_ i: Int, _ j: Int, rows: Int, columns: Int, visited: [[Int]]) -> [(Int, Int)] { // returns neighbor of up, down, left or right
    var moves = [(Int, Int)]() // list of tuples / coordinates
    // print("rows:", rows, "Columns:", columns, "| (\(i),\(j))")
    // up-left
    if i-2 >= 0 && j-1 >= 0 && visited[i-2][j-1] == -1 {
        moves.append((i-2, j-1))
    }
    
    // up-right
    if i-2 >= 0 && j+1 < columns && visited[i-2][j+1] == -1 {
        moves.append((i-2, j+1))
    }
    
    // left up
    if i+1 < rows && j-2 >= 0 && visited[i+1][j-2] == -1 {
        moves.append((i+1, j-2))
    }
    
    // left down
    if i-1 >= 0 && j-2 >= 0 && visited[i-1][j-2] == -1 {
        moves.append((i-1, j-2))
    }
    
    // down left
    if i+2 < rows && j-1 >= 0 && visited[i+2][j-1] == -1 {
        moves.append((i+2, j-1))
    }
    
    // down right
    if i+2 < rows && j+1 < columns && visited[i+2][j+1] == -1 {
        moves.append((i+2, j+1))
    }
    
    // right up
    if i-1 >= 0 && j+2 < columns && visited[i-1][j+2] == -1 {
        moves.append((i-1, j+2))
    }
    
    // right down
    if i+1 < rows && j+2 < columns && visited[i+1][j+2] == -1 {
        moves.append((i+1, j+2))
    }
    
    return moves
}

let num = find_minimum_number_of_moves(rows: 5, cols: 5, start_row: 0, start_col: 0, end_row: 4, end_col: 1)
if num == 3 { print("you did it wow...") }

// I actually programmed this. This is literally the most advanced program I've ever written and I feel like I am on cloud nine. Today was also the day I found out Jen is pregnant. So MPV moment. Mar 7, 2022