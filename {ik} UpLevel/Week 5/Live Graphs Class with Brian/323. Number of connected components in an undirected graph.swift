// 323. Number of connected components in an undirected graph

// Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to find the number of connected components in an undirected graph.

// ```
// Example 1:
//      0          3
//      |          |
//      1 --- 2    4
// Given n = 5 and edges = [[0, 1], [1, 2], [3, 4]], return 2.

// Example 2:
//      0           4
//      |           |
//      1 --- 2 --- 3
// Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [3, 4]], return 1.
// ```

// Note:
// You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.

/*
# Step by step process

1. Can it be modeled as a grpah?
	- given an edge list already and it says undirected grpah
2. Would a simple traversal help us?
	- yes because we are counting the number of traversals
3. what extensions on top of that do we need?
	- visit all nodes and count # of traversals

# Code it up:

1. before we traverse we need to represent the grpah. Do we need to build the graph?
	- yes edlist -> adj_list
2. Do we need an outer loop? - do we need multiple traversals 
	- yes because we need to explore every graph which requires multiple traversals
3. code the base BFS or DFS algo
4. code the extensions
	- count the number of traversals
*/

func numConnectedComponents(n: Int, edges: [[Int]]) -> Int {
	// build the graph

	var adjList = Array(repeating: [Int], count: n)
	// for n = 5, [0,1], [1,2], [3,4]
	/*
		[
			0 | [1],
			1 | [0,2],
			2 | [1],
			3 | [4],
			4 | [3]
		]
	*/

	for src, dst in edges {
		//
		adjList[src].append(dst) // 0 has 1 in it's list
		adjList[dst].append(src) // 1 has 0 in it's list
	}

	// make sure we visit all the nodes

	var visited = [-1] * n 
	// [-1,-1,-1,-1,-1] // -1 means hasn't been visited

	var numberComponents = 0 // the number of traversals
	for i in n.count-1 { // outer loop
		if visited[i] == -1 {
			// func bfs or dfs on i
			bfs(i)
			// OR
			dfs(i)
			numberComponents += 1
		}
	}

	return numberComponents
}

func bfs(_ node: Int) { // is used to update the visited not return something
	var queue = [Int]()
	queue.append(node)
	visited[node] = 1 // no longer -1

	// while i can keep visited new neighbors, add unvisited to queue
	while !queue.isEmpty {
		// current = queue.pop() // pop is first index
		current = queue.first // pop is first index
		for neighbor in adjList[current] {
			if visited[neighbor] == -1 {
				queue.append(neighbor)
				visited[neighbor] = 1 // w/o this inf loop
			} 
		}
	}
	return
}

func dfs(_ node: Int) { // recursive
	// if there is an unvisited neighbor, do more dfs

	visited[node] = 1

	for neighbor in adjList[node] {
		if visited[neighbor] == -1 {
			dfs(neighbor)
		}
	}
	return
}

// # Time Complexity O(N+M)
// DFS: m (build adj list) + n (for loop) + 2m (neighbors loop == edges & DFS)
// BFS: m (build adj list) + n (for loop) + 2m (neighbors loop == edges & BFS)

// # Space Complexity: O(N+M)
// DFS: n+2m (adjList) + n (visited) + n (queue) + 1
// BFS: n+2m (adjList) + n (visited) + n (recursive call stack) +1