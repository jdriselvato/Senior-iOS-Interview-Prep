// 323. number of connected components in an undirected graph

func numberOfConnectedComponents(n: Int, edges: [[Int]]) -> Int {
	// build a graph

	var adjList = Array(repeating: [Int](), count: n)
	for i in 0..<edges.count {
		let source = edges[i][0]
		let dest = edges[i][1]

		adjList[source].append(dest)
		adjList[dest].append(source) // undirected
	}

	
	// dfs
	var visited = Array(repeating: -1, count: n)
	print(visited)

	func dfs(_ node: Int) {
		print(visited)
		visited[node] = 1

		for neighbor in adjList[node] {
			if visited[neighbor] == -1 {
				dfs(neighbor)
			}
		}
	}

	var count = 0

	// outer loop
	for vector in 0..<visited.count {
		if visited[vector] == -1 {
			dfs(vector)
			count += 1
		}
	}

	print(visited)

	return count
}

var n = 5
var edges = [[0,1],[1,2],[3,4],[0,4]]

let count = numberOfConnectedComponents(n: n, edges: edges)
print(count)

