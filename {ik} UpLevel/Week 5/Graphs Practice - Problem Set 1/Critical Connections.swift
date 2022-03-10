// Critical Connections

// Given a network of servers where each server is connected to every other server directly or indirectly through the bidirectional connections in the network, find all the critical connections.

// A connection in a connected network is said to be critical if removing it disconnects the network.

// Example One

// {
// "number_of_servers": 5,
// "connections": [
// [0, 1],
// [0, 2],
// [0, 4],
// [1, 2],
// [1, 3]
// ]
// }
// Output:

// [
// [0, 4],
// [1, 3]
// ]
// Order of servers within a connection and order of connections in the output does not matter, so another one of several other correct outputs here is

// [
// [3, 1]
// [0, 4],
// ]


// Example Two

// {
// "number_of_servers": 4,
// "connections": [
// [0, 1],
// [0, 2],
// [0, 3]
// [1, 2],
// [2, 3]
// ]
// }
// Output:

// [
// [-1, -1]
// ]
// Removing any one connection won't disconnect the network.

// Notes

// Return [[-1,-1]] if there are no critical connections in the network.
// Constraints:

// 1 <= number of servers <= 105
// 0 <= number of connections <= 105
// Servers are numbered from 0 to (number of servers - 1)
// There are no self-loops and no multiple edges

func find_critical_connections(number_of_servers: Int, connections: [[Int]]) -> [[Int]] {

    return [[-1,-1]]
}

1. Is this a graph question? Yes
2. Would a simple graph traversal help solve the problem? probably.
3. 