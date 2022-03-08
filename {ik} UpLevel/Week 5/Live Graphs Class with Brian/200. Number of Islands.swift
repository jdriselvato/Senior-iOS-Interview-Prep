// 200. Number of Islands


// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

// Example 1:

// Input: grid = [
//   ["1","1","1","1","0"],
//   ["1","1","0","1","0"],
//   ["1","1","0","0","0"],
//   ["0","0","0","0","0"]
// ]
// Output: 1



// 1. Can this be a graph?
// 	- doesn't seem to have cirlces or edges but "connecting and adjacent" are edge and vertex words
// 	- `node` = land
// 	- `edge` = connecting horizontally or vertically

// 2. Should we traverse?
// 	- yes because we are trying to count the conncections.
// 	- Very similar question to 323. Number of connected components in an undirected graph
// 	- but we can do BFS

// Neighbor:
// 	1. land
// 	2. up, down, left or right
// 	3. in bounds // meaning it's in the array

// 3. extension
// 	- the graph is different. Getting the Neighbors are different.

// Code it up:

// 1. build the graph?
// 	- we build graphs whne we need an easy way to get neighbors of any node
// 	- NO, the input is already a graphs
// 2. Do we need a loop?
// 	- YES, we have multiple islands
// 3. BFS
// 4. Add extension

func numIslands(map: [[Int]]) -> Int {
	// map is 2d array

	var rows = map.count
	var columns = map[0].count

	var visited = [([-1] * cols) for i in range(rows)]

	// visited can also be a set of tuples and add them to your visited set

	var islands = 0

	// 2d loop
	for i in range(rows) {
		for j in range(colums) {
			if visited[i][j] == -1 && map[i][j] == 1 { // only land
				// only do bfs is land
				bfs(i, j)
				islands += 1
			}
		}
	}

	return islands
}

func bfs(_ i: Int, _ j: Int) { // base BFS but for 2D array

	visited[i][j] = 1
	var queue = [(Int, Int)]()
	queue.append((i, j))

	while !queue.isEmpty {
		// add unvisited neighbors to the queue and visit them
		c_i = q.first
		c_j = q.first
		for neighbors(i, j) in getNeighbors(c_i, c_j) { // is it up, down, left or right
			if visited[n_i][n_j] == -1 {
				q.add((n_i, n_j))
				visited[n_i][n_j] = 1
			}
		}
	}
}

func getNeighbors(_ i: Int, j: Int, maps, rows, columns) -> [(Int, Int)] { // returns neighbor of up, down, left or right
	var neighbors = [(Int, Int)]() // list of tuples / coordinates

	// up
	if i - 1 >= 0 && map[i-1][j] == 1 {
		neighbors.append((i-1, j))
	}

	// down
	if i + 1 < rows && map[i+1][j] == 1 {
		neighbors.append((i+1, j))
	}

	// left
	if j - 1 >= 0 && map[i][j-1] == 1 {
		neighbors.append((i, j-1))
	}

	// right
	if j + 1 > columns && map[i][j+1] == 1 {
		neighbors.append((i, j+1))
	}

	return neighbors
}

/*
# Space: O(r*c)
- r*c (vsisted) + r*c (queue) + constants

# Time: O(r*c)
- r*c*4 (up,down,left,right)
*/