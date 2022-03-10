// Count Islands

// Given a two-dimensional matrix of 0s and 1s, find the number of islands.

// An island is a group of connected 1s or a standalone 1. A cell in the matrix can be connected to up to 8 neighbors: 2 vertical, 2 horizontal and 4 diagonal.

// Example

// {
// "matrix": [
// [1, 1, 0, 0, 0],
// [0, 1, 0, 0, 1],
// [1, 0, 0, 1, 1],
// [0, 0, 0, 0, 0],
// [1, 0, 1, 0, 1]
// ]
// }
// Output:

// 5
// Notes

// Use as little extra memory as possible.

// Solve the problem without allocating a "visited" matrix.

// Constraints:

// 1 <= rows <= 450
// 1 <= columns <= 450


func count_islands(matrix: [[Int]]) -> Int {
    var matrix = matrix
    
    var rows = matrix.count
    var columns = matrix[0].count
    
    var islands = 0
    
    func bfs(_ i: Int, _ j: Int) { // base BFS but for 2D array
        matrix[i][j] = 0
        
        var queue = [(Int, Int)]()
        queue.append((i, j))
        
        while !queue.isEmpty {
            guard let node = queue.first else { return }
            
            for neighbor in getNeighbors(node.0, node.1, matrix, rows, columns) {
                if matrix[neighbor.0][neighbor.1] == 1 {
                    queue.append((neighbor.0, neighbor.1))
                }
                matrix[neighbor.0][neighbor.1] = 0 // no longer a part of the island we want to count
            }
            queue.removeFirst()
        }
    }
    
    // 2d loop
    for i in 0..<rows {
        for j in 0..<columns {
            if matrix[i][j] == 1 { // only land
                // only do bfs is land
                bfs(i, j)
                islands += 1
            }
        }
    }
    
    return islands
}

func getNeighbors(_ i: Int, _ j: Int, _ map: [[Int]], _ rows: Int, _ columns: Int) -> [(Int, Int)] { // returns neighbor of up, down, left or right
    var neighbors = [(Int, Int)]() // list of tuples / coordinates
    
    // up
    if i-1 >= 0 && map[i-1][j] == 1 {
        neighbors.append((i-1, j))
    }
    
    // down
    if i+1 < rows && map[i+1][j] == 1 {
        neighbors.append((i+1, j))
    }
    
    // left
    if j-1 >= 0 && map[i][j-1] == 1 {
        neighbors.append((i, j-1))
    }
    
    // right
    if j+1 < columns && map[i][j+1] == 1 {
        neighbors.append((i, j+1))
    }
    
    //diagonals
    
    if j-1 >= 0 && i+1 < rows {
        neighbors.append((i+1, j-1))
    }
    
    if j+1 < columns && i-1 >= 0 {
        neighbors.append((i-1, j+1))
    }
    
    if j-1 >= 0 && i-1 >= 0 {
        neighbors.append((i-1, j-1))
    }
    
    if j+1 < columns && i+1 < rows {
        neighbors.append((i+1, j+1))
    }
    
    return neighbors
}

let mat = [
    [1, 1, 0, 0, 0],
    [0, 1, 0, 0, 1],
    [1, 0, 0, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 0, 1, 0, 1]
]
let num = count_islands(matrix: mat)
print(num)
