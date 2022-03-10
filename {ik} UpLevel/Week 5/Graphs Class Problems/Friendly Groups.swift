// Friendly Groups

// There are n people living in a town. Some of them dislike each other. Given the value of n and two equal length integer arrays called dislike1 and dislike2. For each i in [0, dislike1_size - 1], the person dislike1[i] dislikes the person dislike2[i]. Check if we can divide the people of the town into two sets such that each person belongs to exactly one set and no two persons disliking each other belong to the same set.

// Example One

// {
// "num_of_people": 5,
// "dislike1": [0, 1, 1, 2, 3],
// "dislike2": [2, 2, 4, 3, 4]
// }
// Output:

// 1
// The people can be partitioned into two sets [0, 1, 3] and [2, 4].

// Example Two

// {
// "num_of_people": 4,
// "dislike1": [0, 0, 0, 1, 2],
// "dislike2": [1, 2, 3, 2, 3]
// }
// Output:

// 0
// Notes

// People are numbered from 0 to n - 1.

// Constraints:

// 1 <= n <= 2*103
// 0 <= number of disliking pairs <= min((n * (n - 1))/2, 104)

func can_be_divided(num_of_people: Int, dislike1: [Int], dislike2: [Int]) -> Bool {
    var adjList = Array(repeating: [Int](), count: num_of_people)
    var visited = Array(repeating: 0, count: num_of_people)
    var parent = Array(repeating: -1, count: num_of_people)
    var distance = Array(repeating: -1, count: num_of_people)

    var edges = [[Int]]()
    for i in 0..<dislike1.count {
        edges.append([dislike1[i], dislike2[i]])
    }

    for edge in edges {
        adjList[edge[0]].append(edge[1])
        adjList[edge[1]].append(edge[0])
    }

    func BiPartite(_ source: Int, _ adjList : [[Int]]) -> Bool { // BFS
        var queue = [source]
        visited[source] = 1
        distance[source] = 0

        while !queue.isEmpty {
            let node = queue.removeFirst()
            for neighour in adjList[node] {
                if visited[neighour] != 1 {
                    visited[neighour] = 1
                    parent[neighour] = node
                    distance[neighour] = 1 + distance[node]
                    queue.append(neighour)
                }

                if  distance[neighour] == distance[node] {
                    return false // not BiPartite - causes even no of nodes including cross edge
                }
            }
        }

        return true 
    }

    for vertex in 0..<num_of_people {
        if visited[vertex] == 0 {
            if !BiPartite(vertex, adjList) {
                return false
            }
        }
    }

    return true
}