// 261. Graph Valid Tree - Medium
/*
Problem:

Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.

For example:

Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.

Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.

Show Hint Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
*/

/*
# ==Step By Step Process==

1. can it be modeled as a graph?
	- yes it say it is
2. would a simple traversal help us?
	- yes, to make sure it's connected and no cycles
3. what extensions on top of that do we need?
	- cycle detection
	- counts only 1 traversal
	- check graph is 1 connected component
4. Code it up
	1. build a graph; yes, edge list
	2. outer loop; yes
	3. either bfs or dfs
*/

func isValidGraphTree(n: Int, edges: [[Int]]) -> Bool {
	// build the graph

	var adjList = Array(repeating: [-1], count: n)
	var parentList = Array(repeating: [-1], count: n)
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
		adjList[src].append(1) // 0 has 1 in it's list
		adjList[dst].append(src) // 1 has 0 in it's list
	}

	// make sure we visit all the nodes

	var visited = Array(repeating: [-1], count: n)
	// [-1,-1,-1,-1,-1] // -1 means hasn't been visited

	var numberComponents = 0 // the number of traversals
	for i in n.count-1 { // outer loop
		if visited[i] == -1 {
			// func bfs or dfs on i
			if !bfs(i) {
				return false // as it's a cycle
			}
			// OR
			// dfs(i)
			numberComponents += 1
		}
	}

	return numberComponents == 1 // it should only be one graph
}

func bfs(_ node: Int) -> Bool { // is used to update the visited not return something
	var queue = [Int]()
	queue.append(node)
	visited[node] = 1 // no longer -1

	// while i can keep visited new neighbors, add unvisited to queue
	while !queue.isEmpty {
		// current = queue.pop() // pop is first index
		current = queue.first // pop is first index
		for neighbor in adjList[current] {
			if visited[neighbor] == -1 { // seeing something new (tree edge)
				queue.append(neighbor)
				visited[neighbor] = 1 // w/o this inf loop
				parentList[neighbor] = current // parent of my neighbor is my current

			} else { // seen it (neighbor) before
				// possible when: 
				//		1. two nodes are connected to each other parent is connected to child. Child is connected to parent
				//		2. a cross edge something we've seen before and it's a cross edge. Which means it's a cycle. meaning it's not a parent child relationship

				// Q: How do we do this? A: Keep track of it's parents.
				if parentList[current] != neighbor { // cycle
					return false // mean's its a cycle cycles are not trees
				}
			}
		}
	}

	return true
}

// It's better to call something a cycle than a cross edge, since a lot of interviewers don't know that term

func dfs(_ node: Int) -> Bool { // recursive
	// if there is an unvisited neighbor, do more dfs

	visited[node] = 1

	for neighbor in adjList[node] {
		if visited[neighbor] == -1 {
			parentList[neighbor] = node // parent of my neighbor is my current node
			if !dfs(neighbor) { // prevent premature return
				return false
			}
		} else { // something I've seen before
			if parentList[node] != neighbor { // cycle
				return false
			}
		}
	}
	return true
}

// # Time Complexity O(N+M)
// DFS: m (build adj list) + n (for loop) + 2m (neighbors loop == edges & DFS)
// BFS: m (build adj list) + n (for loop) + 2m (neighbors loop == edges & BFS)

// # Space Complexity: O(N+M)
// DFS: n+2m (adjList) + n (visited) + n (parent) + n (queue) + 1
// BFS: n+2m (adjList) + n (visited) + n (parent) + n (recursive call stack) +1