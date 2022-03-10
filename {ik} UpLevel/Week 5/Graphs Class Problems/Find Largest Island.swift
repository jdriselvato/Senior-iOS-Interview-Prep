// Find Largest Island

// Given a two-dimensional grid of 0s and 1s, find the size of the largest island. If there is no island return 0.

// An island is a group of 1s connected vertically or horizontally.

// Example One

// {
// "grid": [
// [1, 1, 0],
// [1, 1, 0],
// [0, 0, 1]
// ]
// }
// Output:

// 4
// There are two islands:

// [(0, 0), (0, 1), (1, 0), (1, 1)]
// [(2, 2)]
// Size of the largest (first) island is 4.

// Example Two

// {
// "grid": [
// [0, 0, 0],
// [0, 0, 0],
// [0, 0, 0]
// ]
// }
// Output:

// 0
// Notes

// Constraints:

// 1 <= number of rows <= 200
// 1 <= number of columns <= 200

func max_island_size(grid: [[Int]]) -> Int {
    var matrix = grid
    
    var rows = matrix.count
    var columns = matrix[0].count
    
    var islandSize = 0
    var largest = 0
    
    func bfs(_ i: Int, _ j: Int) { // base BFS but for 2D array
        matrix[i][j] = 0
        islandSize += 1

        var queue = [(Int, Int)]()
        queue.append((i, j))
        
        while !queue.isEmpty {
            guard let node = queue.first else { return }
            
            for neighbor in getNeighbors(node.0, node.1, matrix, rows, columns) {
                if matrix[neighbor.0][neighbor.1] == 1 {
                	islandSize += 1
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
                largest = max(islandSize, largest)
                islandSize = 0
            }
        }
    }
    
    return largest
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

    return neighbors
}

let mat = [
	[0, 0, 0],
	[0, 0, 0],
	[0, 0, 0]
]
let num = max_island_size(grid: mat)
print(num)
