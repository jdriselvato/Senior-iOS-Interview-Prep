// Count Connected Components In An Undirected Graph

// Given an undirected graph, find its total number of connected components.

// Example One

// Graph

// {
// "n": 5,
// "edges": [[0 ,1], [1, 2], [0, 2], [3, 4]]
// }
// Output:

// 2
// Example Two

// Graph

// {
// "n": 4,
// "edges": [[0 , 1], [0 , 3], [0 , 2], [2 , 1], [2 , 3]]
// }
// Output:

// 1
// Notes

// Constraints:

// 1 <= number of nodes <= 105
// 0 <= number of edges <= 105
// 0 <= node value < number of nodes



func number_of_connected_components(n: Int, edges: [[Int]]) -> Int {
    // FIRST - Create a graph
    var adjList = Array(repeating: [Int](), count: n)
    var visited = Array(repeating: -1, count: n)
    var result = 0
    // Create an adjacency list 
    for e in edges {
        guard e.count == 2 else { continue } // This is an invalid edge array as array is supposed to have a source and destination
        let src = e[0]
        let dest = e[1]
        adjList[src].append(dest)
        adjList[dest].append(src)
    }
    
    for vtx in 0...n - 1 {
        if visited[vtx] == -1 {
            result += 1
            dfs(vtx, &adjList, &visited)
        }
    }
    
    return result
}

// Base BFS Code
func bfs(_ source: Int, _ adjList: inout [[Int]], _ visited: inout [Int], _ n: Int) {
    var q = [Int]()
    visited[source] = 1
    while q.count > 0 {
        let node = q.removeFirst()
        for neighbor in adjList[node] {
            if visited[neighbor] == -1 {
                visited[neighbor] = 1
                q.append(neighbor)
            }
        }
    }
}

// Base DFS Code
func dfs(_ node: Int, _ adjList: inout [[Int]], _ visited: inout [Int]) {
    visited[node] = 1
    for n in adjList[node] {
        if visited[n] == -1 {
            dfs(n, &adjList, &visited)
        }
    }
}
