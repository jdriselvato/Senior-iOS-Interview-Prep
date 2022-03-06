// 909. Snakes and Ladders

one dice roll away: 1-6

inputs: 
	`n` = 36
	`s_l` = [0, 1, 15, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 35, 15, 16, 13, ...]

Answer: 4

1. Is it a graph problem?
	- yes, each square are a node and "edges" exist between squares (neighbors) between 1 dice roll.
	- and directed because you can go from 0 to 1 but there's no way to go from 1 to 0.
2. What kind of traversal?
	- Shortest path is always DFS !!!

3. Extension
	- shortest path
	- keep track of distance
	- getting neighbors is different from adjList, we have a board and dice roll

Code it up:
1. do we need to build a graph
	- no, because we can easily get the neighbors from incrementing 1 through 6 from one square and looking up in s_l
2. do we need an outer loop
	- no, we always start from 0. always end at goals quare. if there is a valid path (they are connected) 1 traversal will find it.
3. DFS or BFS?
	- DFS since it's shortest path
4. Extensions

func snakesAndLetters(n: Int, s_l: [Int]) {
	var distance = Array(repeating: [-1], count: n+1) // +1 since 0 to n
	// will store how many dice rolls away from this square is from 0

	var q = [Int]()
	q.push(0)
	distance[0] = 0

	while !q.isEmpty {
		var curr = q.pop()
		for rolled in curr+1..<curr+6 { // dice roll
			neighbor = s_l[rolled]
			if distance[neighbors] == -1 {
				q.push(neighbor)
				// neighbor is 1 dice roll away from current
				distance[neighbors] = distance[curr]+1
			}
			if neighbor == n {
				return distance[n] // we made it to the end
			}
		}
	}

	return -1 // not possible
}

Time complexity: O(n)