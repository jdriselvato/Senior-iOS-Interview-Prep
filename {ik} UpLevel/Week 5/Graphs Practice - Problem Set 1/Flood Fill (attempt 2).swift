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
    if image[pixel_row][pixel_column] == new_color { return image } // already colored
    
    var newImage = image
    
    func bfs(_ row: Int, _ col: Int, _ newColor: Int) -> [[Int]] {
        
        let oldColor = newImage[row][col]
        newImage[row][col] = newColor
        
        var q = [Node]()
        q.append((row, col))

        while !q.isEmpty {
            let (r, c) = q.removeFirst()
            
            let neighbors = getNeighbors(r, c, oldColor)
            for (nr, nc) in neighbors {
                q.append((nr, nc))
                newImage[nr][nc] = newColor
            }
        }
        
        return newImage
    }
    
    func getNeighbors(_ row: Int, _ col: Int, _ oldColor: Int) -> [(Int, Int)] {
        var neighbors = [Node]()
        
        if row > 0, newImage[row - 1][col] == oldColor { // up
            neighbors.append((row - 1, col))
        }
        
        if col > 0, newImage[row][col - 1] == oldColor { // left
            neighbors.append((row, col - 1))
        }
        
        if row < newImage.count - 1, newImage[row + 1][col] == oldColor { // down
            neighbors.append((row + 1, col))
        }
        
        if col < newImage[0].count - 1, newImage[row][col + 1] == oldColor { // right
            neighbors.append((row, col + 1))
        }
        
        return neighbors
    }
    
    let result = bfs(pixel_row, pixel_column, new_color)
    return result
}
