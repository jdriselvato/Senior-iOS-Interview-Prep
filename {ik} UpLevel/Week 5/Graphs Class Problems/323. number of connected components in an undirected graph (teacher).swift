// 323. number of connected components in an undirected graph

func numberOfConnectedComponents(n: Int, edges: [[Int]]) -> Int {

	// build graph
	var adjList = Array(repeating: [Int](), count: n) // because there's only n number of components

	for i in 0..<edges.count {
		let source = edges[i][0]
		let dest = edges[i][1]
		adjList[source].append(dest)
		adjList[dest].append(source)
	}

	var visited = Array(repeating: -1, count: n)

	// DFS or BFS
	func dfs(_ node: Int) {
		visited[node] = 1

		for neighbor in adjList[node] {
			if visited[neighbor] == -1 {
				dfs(neighbor)
			}
		}
	}

	// outer loop
	var count = 0
	for vector in 0..<n {
		if visited[vector] == -1 {
			dfs(vector)
			count += 1
		}
	}

	return count
}

var n = 5
var edges = [[0,1],[1,2],[3,4]]

let count = numberOfConnectedComponents(n: n, edges: edges)
print(count)