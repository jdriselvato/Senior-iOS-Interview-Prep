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

    var adjList = Array(repeating: [Int](), count: n)
    var visited = Array(repeating: -1, count: n)

    for edge in edges {
        guard edge.count == 2 else { continue }
        let src = edge[0]
        let dest = edge[1]
        adjList[src].append(dest)
        adjList[dest].append(src)
    }
    
    func dfs(_ node: Int) {
        visited[node] = 1
        for n in adjList[node] {
            if visited[n] == -1 {
                dfs(n)
            }
        }
    }

    var result = 0

    for node in 0..<n {
        if visited[node] == -1 {
            result += 1
            dfs(node)
        }
    }
    
    return result
}


let n = 4
let edges: [[Int]] = [[0 , 1], [0 , 3], [0 , 2], [2 , 1], [2 , 3]]
let answer = number_of_connected_components(n: n, edges: edges)
print(answer)