// 785. Bipartite Graph

/*
1. Can it be modeled as a grpah?
	- say's it's a graph.
	- bipartite, we can split the graph into two subsets, A | B.
		- IS: `a->b->c` would be because we can zigzag.
		- NOT: `a->b->c->a` isn't because it's the same group.
		- NOT: If the cycle is odd, it'll ref a node in the same group. 
2. Would a simple traversal help us?
	- As we traverse the graph we assign subsets
	- if we saw something again, we question it's subset. 
		- if it's a different group, it's ok.
		- if it's in the same group, it's not a bipartites
3. what extensions on top of that do we need?
	- assign subsets as we traverse if same subset has an edge it's not a bipartites

Code it up:

1. Build a graph?
	- yes, given undirect edge list
2. do we need an outer loop?
	- yes, but it doesn't need to be connected to be bipartites
3. base bfs or dfs?
	- DFS this time just cause it's easier to program
4. code extension
*/

// build the graph

var adjList = Array(repeating: [Int], count: n) // i in n.count
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
	set.add(src)
	set.add(dst)
}

var = set.size() // if they don't give us n

var visited = Array(repeating: [-1], count: n)
var subset
 = Array(repeating: [-1], count: n)

for i in n.count-1 {
	if visited[i] == -1 {
		subset[i] = 0
		if !dfs(i) {
			return false
		}
	}
}

freturn true

func dfs(_ node) {
	visited[node] = 1
	for neighbor in adjList[node] {
		if visited[neighbor] == -1 {
			// assign the opposite subset
			// this sets which side of A | B they are in
			subset[neighbor] = (subset[node] == 0) ? 1 : 0 // `1 - subset[node]`

			if !dfs(neighbor) {
				return false
			}
		} else {
			// if we've seen this node before, is it the same subset, if so return false.
			// child parent connection doesn't matter.
			if subset[node] == subset[neighbor] { // edge between them and in same subset
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
// DFS: n+2m (adjList) + n (visited) + n (queue) + 1
// BFS: n+2m (adjList) + n (visited) + n (recursive call stack) +1