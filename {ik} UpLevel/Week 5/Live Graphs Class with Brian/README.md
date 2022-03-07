# Live Graphs Class with Brian

# Introduction: 

- Brian Kim: Coursera / Google / GoFundMe / Lyft 

## Steps to tackling interview questions on Graphs

- step 1: could the problem be modeled as a graph problem?
- step 2: would a simple grpah traversal help solve th e problem
- step 3: would some popular standard extension of it help solve the problem?
- step 4: code it up

## General questions about Graphs

**Q:** What are graphs?
	- n-objects with m-pariwise relationships
	- n-nodes & m-edges

**Q:** what kind of graphs are there?
	- Directed / Undirected / Weights / Trees / Cycles / Complete graphs

**Q:** Examples of graphs?
	- Directed: Social Networks / Connections / Friends
	- Undirected: Following on Twitter / Subscribing on Youtube
	- Directed: Google Maps / Maps / Physical space
	- General: Internet

**Q:** Why should we study them?
	- A lot of the big company's products are fundamentally are graphs (Google, Pinterest, Facebook, Amazon shipping, etc)
	- Graph question are pretty common; Graphs are popular onsite interviews.

# Today's curriculum:

- Undirected (bfs/dfs)
- Directed (bfs/dfs)

# Undirected

## Traversing a graph

## Adjacency Matrix:

This: `0 -- 1 -- 2` as a matrix:

``` cs
   0  1  2
0 [0, 1, 0]
1 [1, 0, 1]
2 [0, 1, 1]
```

- Checking if a node is connected to another node
- 0 is not connected / 1 is connected
- Is symmetrical

**Space complexity:** 
	- `O(n^2)` since it's a matrix

**Time complexity:**

- CongnitivityCheck(a,b): `O(1)`
- neighbors(a): `O(n)`
- a list of nieghbors of a: `O(n)`

## Adjacency List:

Same graph: `0 -- 1 -- 2`

What goes into it is our connectivity(a,b)

Basic structure:
```
0 | []
1 | []
2 | []
```

List of lists:
```
0 | [1]
1 | [0,2]
2 | [1]
```

**Space complexity:** 
	- `O(n+2m)`  
	- n = # vertex
	- m = edges to vertex
	- 2 because 0 -> 1 & 1 -> 0 connections twice

**Time complexity:**
- CongnitivityCheck(a,b): `O(degree of the node)`
	* a degree is the number of connections to a source
	- shower than adj matrix
- neighbors(a): `O(1) constant`
	- which makes this a good traversal method


## Adjacency Map:

- Format: `dictionary` w/ list of `sets`; indcated as {}

```
0| {}
1| {}
2| {}
```

Same graph: `0 -- 1 -- 2`

```
0| {1}
1| {0, 2}
2| {1}
```

- you can easily check, is 2 in this hash set?

**Space complexity:** 
- `0(n+2m)`

**Time complexity:**
- CongnitivityCheck(a,b): `O(1)`
- neighbors(a): `O(1) constant` <-- this is the most used func of AdjMap

Adjacency Map is the best of both worlds

----

|Adj matrix 	|	vs 	|	adj map |
-----------------------------------
|n^2 	|	space complexity - storage connectivity		|	n+2m |

- When to use which depends on the problem
- Traversal cares more about neighbors, and the quickest is `O(1)` as seen in Adj Map. Constant time look up.
	- Doing things in a set is faster than looking through lists or matrix


# Pseudocode for general graph Traversal - neighbors

## BFS: one node to all possible neighbors with queues
- FIFO queue - interative


## DFS: one node to the leaf and go back to neighbors
- LIFO stack - recursive

## Dijksta, Prims / Best-first/A*
- Priority Queue that stores the vertices, then each vertex is inserted into the bag with some priority. The vertext that is next pulled out of the bag is the one with the highest priority.

-----

# How to approach Leetcode problems

## ==Step By Step Process==

1. can it be modeled as a graph?
2. would a simple traversal help us?
3. what extensions on top of that do we need?
4. Code it up

## ==Steps to code it up==
1. before we traverse we need to represent the graph. Do we need to build the graph?
2. Do we need an outer loop? - do we need multiple traversals 
3. code the base BFS or DFS algo
4. code the extensions

-----

## 323. Number of connected components in an undirected graph

[Read notes here](<./323. Number of connected components in an undirected graph.swift>)

## 261. Graph Valid Tree

[Read notes here](<./261. Graph Valid Tree.swift>)

## 785. Bipartite Graph

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
	- visit all nodes and count # of traversals

# Time Complexity O(N+M)
DFS: m (build adj list) + n (for loop) + 2m (neighbors loop == edges & DFS)
BFS: m (build adj list) + n (for loop) + 2m (neighbors loop == edges & BFS)

# Space Complexity: O(N+M)
DFS: n+2m (adjList) + n (visited) + n (queue) + 1
BFS: n+2m (adjList) + n (visited) + n (recursive call stack) +1

[Read notes here](<./785. Bipartite Graph.swift>)

# 886. Possible Bipartition

Exact same problem as [785. Bipartite Graph](<./785. Bipartite Graph.swift>)


# 200. Number of Islands

- vary famous questions. Amazon - online assessments
- Very similar question to [323. Number of connected components in an undirected graph](<./323. Number of connected components in an undirected graph.swift>)

Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

1. Can this be a graph?
	- doesn't seem to have cirlces or edges but "connecting and adjacent" are edge and vertex words
	- `node` = land
	- `edge` = connecting horizontally or vertically

2. Should we traverse?
	- yes because we are trying to count the conncections.
	- Very similar question to 323. Number of connected components in an undirected graph
	- but we can do BFS

Neighbor:
	1. land
	2. up, down, left or right
	3. in bounds

3. extension
	- the graph is different. Getting the Neighbors are different.

Code it up:

1. build the graph?
	- we build graphs whne we need an easy way to get neighbors of any node
	- NO, the input is already a graphs
2. Do we need a loop?
	- YES, we have multiple islands
3. BFS
4. Add extension



### Space: `O(r*c)`
- r*c (vsisted) + r*c (queue) + constants

### Time: `O(r*c)`
- r*c*4 (up,down,left,right)

[Read notes here](<./200. Number of Islands.swift>)

- seen in The Flood Fill problem https://leetcode.com/problems/flood-fill/

----
----

# Directed Graphs

**Q:** Is it straightforward to detect if a directed graph has a cylce by looking at the BFS tree? No
**Q:** When would you do a BFS on a directed graphy? Shorted path

# 909. Snakes and Ladders - BFS

Given a snake and ladder game, find the minimum number of throws (dice rolls 1-6) required to win the game.

- IMPORTANT: Shortest path is always DFS !!!
	and shortest path questions are super popular


[Read notes here](<./909. Snakes and Ladders.swift>)

----

**Q:** What about DFS on a directed graph?

# 207. Course Schedule

- This is a cycle detection on a directed graph
- use the idea of bookkeeping...
	- the use of arrival and departure on the stack call

Time & space: `O(n+m)`

[Read notes here](<./207. Course Schedule.swift>)

# 210. Course Schedule II

Same problem but return the course schedule instead of if it's possible

[Read notes here](<./210. Course Schedule II.swift>)

^ Top sort.

- Alternative to Topological sort is Kahn

--

## Kahn's method
- Calculate and maintain an in-degree array for each vertex. KEep all vertices with zero in-degree in a queue or stack. 
- IF graph is a DAG, there must exist a vertex with 0 indegree.
- make the first vertex in the topological sort and delete all its outgoing edges
	- means update in degree array by decrementing the in-degree counts
- if any new vertex with in-degree count 0 is found, add it to the queue stack.
- Repeat until all vertices in the graph are sorted
- Time: O(V+E)

```
func kahns(n, edges) -> [Int] {
	# return a topological sort

	# Do we need an adjList?
	# 	Yes to decrement neighboring indegrees

	algList = [[] of i in range(n)]
	inDegree = [0] * n

	for src, dst in edges {
		adjList[src].append(dst)
		inDegree[dist]++
	}

	q = [Int]()

	for i in range(n) {
		if inDegree[i] == 0 {
			q.push(i)
		}
	}

	topsort = []

	while !q.isEmpty {
		current = q.pop()
		topsort.append(curr)

		# we decrement the neighboring 

		for neighbor in adjList[curr] {
			inDegree[neighboor]--
			if inDegree[neighbor] == 0
				q.push(neighbor)
		}
	}

	if len(topsort) != n { // because it's a cycle?
		return []
	}

	return topsort
}
```

### Google Problem
Can be solved with bookkeeping or kahns
- Flight Itinerary problem
	given a bunch of airline tickets with [from, to] for example [MUC, LHR], [CDG, MUC], [SFO, SJC], [LHR, SFO] reconstruct the itinerary in order
Answer: [CDG, MUC, LHR, SFO, SJC]

// tickets can be represented 

-------

# Interview tips for Graphs

- Make sure DFS and BFS are solid
	- DFS for shortest path
	- Cycle detection
	- What is the traversal doing? will it help me with that problem?
- Read the first 100 problems and figure out what type of question it is 
	- Identifying problems
- Union find is becoming popular


