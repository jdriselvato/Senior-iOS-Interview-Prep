// Complete All Courses With Dependencies

// A university has n courses to offer. To graduate from that university, a student must complete all those courses. Some courses have prerequisite courses. One can take a course only after completing all of its prerequisites. Dependencies between the courses are described by two arrays a and b of the same size: course a[i] must be taken before course b[i] for all valid indices. Is it possible to complete all the courses without violating constraints?

// Example One

// {
// "n": 4,
// "a": [1, 1, 3],
// "b": [0, 2, 1]
// }
// Output:

// 1
// One possible ordering is 3, 1, 0, 2.

// Example Two

// {
// "n": 4,
// "a": [1, 1, 3, 0],
// "b": [0, 2, 1, 3]
// }
// Output:

// 0
// Every possible ordering of the courses violates at least one of the constraints.

// Notes

// The courses are labeled from 0 to n - 1.
// Constraints:

// 2 <= n <= 100000
// 1 <= size of a = size of b <= 100000
// 0 <= a[i], b[i] < n holds for any valid index i
// a[i] != b[i] holds for any valid index i
// No duplicate dependencies are present


// The extention: 
//		- check if graph has a loop. If so, it cannot be completed
//		- If there are two separate components, is that valid? I think so

func can_be_completed(n: Int, a: [Int], b: [Int]) -> Bool {
	// Create Graph
	var adjList = Array(repeating: [Int](), count: n)
	for i in 0..<a.count {
		adjList[a[i]].append(b[i]) // directed graph
	}



	// DFS or BFS
	var visited = Array(repeating: -1, count: n)
	var arrival = Array(repeating: -1, count: n)
	var departure = Array(repeating: -1, count: n)

	func dfs(_ node: Int) -> Bool {
		visited[node] = 1

		arrival[node] = 1

		for neighbor in adjList[node] {
			if visited[neighbor] == -1 {
				if !dfs(neighbor) {
					return false
				}
			} else {

				if departure[neighbor] == -1 { // if it's already been visited it's a cycle
					return false
				} 
				continue
			}
		}

		departure[node] = 1
		return true
	}

	// Outer loop
	for vector in 0..<n-1 {
		if visited[vector] == -1 {
			if !dfs(vector) {
				return false
			}
		}
	}

    return true
}

let n = 4
let a = [1, 1, 3]
let b = [0, 2, 1]

let can = can_be_completed(n: n, a: a, b: b)
print("\tTest 1 - correct:", can == true, "Got:", can)

let a2 = [1, 1, 3, 0]
let b2 = [0, 2, 1, 3]
let can2 = can_be_completed(n: n, a: a2, b: b2)
print("\tTest 2 - correct:", can2 == false, "Got:", can2)