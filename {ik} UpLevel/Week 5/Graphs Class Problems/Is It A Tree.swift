// Is It A Tree

// Given an undirected graph, find out whether it is a tree.

// The undirected edges are given by two arrays edge_start and edge_end of equal size. Edges of the given graph connect nodes edge_start[i] and edge_end[i] for all valid i.

// Example One

// Graph 1

// {
// "node_count": 4,
// "edge_start": [0, 0, 0],
// "edge_end": [1, 2, 3]
// }
// Output:

// 1
// This graph is a tree because all the nodes are connected, and it does not have cycles.

// Example Two

// Graph 2

// {
// "node_count": 4,
// "edge_start": [0, 0],
// "edge_end": [1, 2]
// }
// Output:

// 0
// This graph is not a tree because node 3 is not connected to the other nodes.

// Example Three

// Graph 3

// {
// "node_count": 4,
// "edge_start": [0, 0, 1, 2],
// "edge_end": [3, 1, 2, 0]
// }
// Output:

// 0
// This graph is not a tree: nodes 0, 1 and 2 form a cycle.

// Example Four

// Graph 4

// {
// "node_count": 4,
// "edge_start": [0, 0, 0, 1],
// "edge_end": [1, 2, 3, 0]
// }
// Output:

// 0
// This graph is not a tree because the two edges that connect nodes 0 and 1 form a cycle.

// Notes

// A tree is an undirected connected acyclic graph.
// Constraints:

// 1 <= number of nodes <= 105
// 1 <= number of edges <= 105
// 0 <= node value < number of nodes


func is_it_a_tree(node_count: Int, edge_start: [Int], edge_end: [Int]) -> Bool {
	if edge_start.count != edge_end.count { return false }

	var visited = Set<Int>()

	var adjList = Array(repeating: [Int](), count: node_count)
	for i in 0..<edge_start.count {
		adjList[edge_start[i]].append(edge_end[i])
		adjList[edge_end[i]].append(edge_start[i])
	}

	func hasCycle(node: Int, parent: Int?) -> Bool {
		visited.insert(node)
		for neighbor in adjList[node] {
			if visited.contains(neighbor) {
				if neighbor != parent {
					return true
				}
			} else if hasCycle(node: neighbor, parent: node) {
				return true
			}
		}
		return false
	}

	if hasCycle(node: 0, parent: nil) {
		return false
	}


	return visited.count == node_count
}