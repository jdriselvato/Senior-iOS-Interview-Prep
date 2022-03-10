// Zombie Clusters

// There are zombies in Seattle. Some of them know each other directly. Others might know each other transitively, through others. For example, if zombies A<->B and B<->C know each other directly, then A and C know each other indirectly and all three belong to one cluster.

// Knowing which zombies know each other directly, find the number of the zombie clusters.

// Input is a square matrix where each cell, zombies[A][B], indicates whether zombie A knows zombie B directly.

// Example One

// {
// "zombies": [
// "1100",
// "1110",
// "0110",
// "0001"
// ]
// }

// Output: `2`

// There are four zombies: z0, z1, z2 and z3.
// Each zombie knows oneself, thus the matrix diagonal has all 1s.
// Other than that, the green matrix cells indicate that z0<->z1 and z1<->z2 know each other directly.
// Because of the transitive property, zombies z0, z1 and z2 form one cluster.
// The remaining zombie, z3, doesn't know others and forms their own separate cluster.
// This gives us a total of 2 zombie clusters.

// func zombie_cluster(zombies: [String]) -> Int {
//     // build graph (adjacency matrix)
//     var matrix = [[Character]]()
//     for row in zombies {
//         matrix.append(Array(row))
//     }
    
//     // first we need # rows and # of columns
//     let rows = matrix.count
//     let columns = matrix.first?.count ?? 0
    
//     var visited = Array(repeating: Array(repeating: -1, count: columns), count: rows)
    
//     var clusters = 0
    
//     func BFS(_ i: Int, _ j: Int) {
//         visited[i][j] = 1
        
//         var queue = [(Int, Int)]()
//         queue.append((i, j))
        
//         while !queue.isEmpty {
//         	guard let node = queue.first else { return }

//             for neighbor in getNeighbors(node.0, node.1, map: matrix, rows: rows, columns: columns) {
//                 if visited[neighbor.0][neighbor.1] == -1 {
//                     queue.append(neighbor)
//                     visited[neighbor.0][neighbor.1] = 1
//                     // matrix[neighbor.0][neighbor.1] = "0"
//                 }
//             }

//             queue.removeFirst()
//         }
//     }
    
//     for i in 0..<rows {
//         for j in 0..<columns {
//             if visited[i][j] == -1 && matrix[i][j] == "1" {
//             	// matrix[i][j] = "0"
//                 BFS(i, j)
//                 clusters += 1
//             }
//         }
//     }
    
//     return clusters
// }

// func getNeighbors(_ i: Int, _ j: Int, map: [[Character]], rows: Int, columns: Int) -> [(Int, Int)] { // returns neighbor of up, down, left or right
//     var neighbors = [(Int, Int)]() // list of tuples / coordinates
    
//     // up
//     if i - 1 >= 0 && map[i-1][j] == "1" {
//         neighbors.append((i-1, j))
//     }
    
//     // down
//     if i + 1 < rows && map[i+1][j] == "1" {
//         neighbors.append((i+1, j))
//     }
    
//     // left
//     if j - 1 >= 0 && map[i][j-1] == "1" {
//         neighbors.append((i, j-1))
//     }
    
//     // right
//     if j + 1 < columns && map[i][j+1] == "1" {
//         neighbors.append((i, j+1))
//     }
    
//     return neighbors
// }


func zombie_cluster(zombies: [String]) -> Int {

    var graph: [[Int]] = Array(repeating: [], count: zombies.count)
    var visited = Array(repeating: -1, count: zombies.count)

    for i in 0..<zombies.count {
        let str = Array(zombies[i])
        for j in 0..<str.count {
            if i != j && str[j] == "1" {
                graph[i].append(j)
            }
        }
    }
   
    func dfs(_ node: Int, _ graph: [[Int]]) {
        if visited[node] == -1 {
            visited[node] = 1
            let nodes = graph[node]
            for n in nodes {
                dfs(n, graph)
            }
        }
    }

    var clusters = 0

    for i in 0..<visited.count {
        if visited[i] == -1 {
            clusters += 1
            dfs(i, graph)
        }
    }

    return clusters
}

let zoms = ["1100", "1101", "1100", "1111"]
let num = zombie_cluster(zombies: zoms)
print(num)