// Flood Fill

// One pixel on a grayscale image changes color. Recolor all the adjacent pixels of the same color to the same new color.

// Grayscale colors are simply numbers.

// Example One

// {
// "pixel_row": 0,
// "pixel_column": 1,
// "new_color": 2,
// "image": [
// [0, 1, 3],
// [1, 1, 1],
// [1, 5, 4]
// ]
// }
// I.e. the pixel at row 0 and column 1 changes to color 2.

// Output:

// [
// [0, 2, 3],
// [2, 2, 2],
// [2, 5, 4]
// ]

// Notes

// Two pixels are considered adjacent if they share a side; sharing a diagonal is not enough.

// Constraints:

// 1 <= image width <= 1000
// 1 <= image height <= 1000
// 0 <= pixel color <= 1000

typealias Node = (Int, Int)

func flood_fill(pixel_row: Int, pixel_column: Int, new_color: Int, image: [[Int]]) -> [[Int]] {

	var rows = image.count
	var columns = image[0].count

	var visited = Array(repeating: Array(repeating: -1, count: columns), count: rows)

	var originalColor: Int = image[pixel_row][pixel_column]
	var newImage = image

	func bfs(_ i: Int, _ j: Int) {
		visited[i][j] = 1

		var queue = [Node]()
		queue.append((i, j))

		while !queue.isEmpty {
			let node: Node = queue.removeFirst()

            for neighbor in getNeighbors(node.0, node.1) {
                newImage[neighbor.0][neighbor.1] = new_color // change the color
                
                if visited[neighbor.0][neighbor.1] == -1 {
                	queue.append((neighbor.0, neighbor.1))
                	visited[neighbor.0][neighbor.1] = 1
                }
            }
        }
    }

    // returns neighbor of up, down, left or right
    func getNeighbors(_ i: Int, _ j: Int) -> [(Int, Int)] { 
        var neighbors = [Node]() // list of tuples / coordinates
        
        // up
        if i-1 >= 0 && newImage[i-1][j] == originalColor {
        	neighbors.append((i-1, j))
        }
        
        // down
        if i+1 < rows && newImage[i+1][j] == originalColor {
        	neighbors.append((i+1, j))
        }
        
        // left
        if j-1 >= 0 && newImage[i][j-1] == originalColor {
        	neighbors.append((i, j-1))
        }
        
        // right
        if j+1 < columns && newImage[i][j+1] == originalColor {
        	neighbors.append((i, j+1))
        }
        
        return neighbors
    }
    
    // cycle through all rows and columns
    for i in 0..<rows {
    	for j in 0..<columns {
    		if visited[i][j] == -1 && newImage[i][j] == originalColor {
    		    if i == pixel_row && j == pixel_column {
    		        newImage[pixel_row][pixel_column] = new_color // change the color of original point
    		    }
    			bfs(i, j)
    		}
    	}
    }
    
    return newImage
}

let r = 0
let c = 0
let new = 1
let img = [
[0, 2, 3],
[4, 5, 6],
[7, 8, 9]
]

let a = flood_fill(pixel_row: r, pixel_column: c, new_color: new, image: img)
print(a)

// Is this a graph question - yes.
// will a simple traversal help? - yes?
// what extension on top of it? - adjacent pixel fill but not diagonal
// Do we need to build a graph? - No image data is enough
// do we need an outer loop? - yes because we have multiple columns and rows of colors to fill
// BFS or DFS? BFS because it's neighboring fill based on adjacency

// For some reason it passed all of them but the 2 massive array ones. Not sure why data is too big. 

// the biggest problem here is filling the original why still BFS-ing the others but ensure not to fill an island pixel of the same color.

// How could I have done this without a visited?