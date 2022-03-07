210. Course Schedule II

This is a cycle detection on a directed graph.

1. is it a graph?
	- yes it's a direct graph since it has dependencies (prereqs) are directed edges

2. would a traversal help?
	- cycle detection on directed grpah
	- not BFS but DFS with bookkeeping would be best

3. what extensions?
	- cycle detection on directed graph so keeping track of callstack

Code it:

1. do we need to build the graph?
	-we are given an edge list (directed)
	- adjList, so yes

2. outer loop
	- yes

3. code base DFS

4.  add bookkeeping extensions

func courseSchedule(n, course) -> Bool{
	adjList = [[] for i in n.count-1]

	time = 0
	arrival = [-1] * n
	departure = [-1] * n

	topSort = [Int]() // topological sort

	for dst, src in course {
		adjList[src].append(dst)
		// we don't go back because it's direct
	}

	visited = [-1] * n

	for i in range(n) {
		if visted[i] == -1 {
			if !dfs(i) {
				return []
			}
		}
	}

	return topSort.reversed() // since leaf nodes departure first in DFS
}

// the leaf nodes depart first in DFS

func dfs(node) {
	visited[node] = 1

	arrival[node] = time++

	for neighbor in adjList[node] {
		if visited[neighbor] == -1 { // tree edge
			if !dfs(neighbor) {
				return false
			}
		} else { // we've seen it before. arrival is set & vsisted
			// back edge or cross/forward edge
			if departure[neighbor] == -1 { //back edge == cycles
				return false
			} else {
				continue
			}
		}
	}

	departure[node] = time++
	topSort.append(node)
	return true
}