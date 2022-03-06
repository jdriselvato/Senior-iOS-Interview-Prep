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

# ==Step By Step Process==

1. can it be modeled as a grpah?
2. would a simple traversal help us?
3. what extensions on top of that do we need?
4. Code it up

# ==Steps to code it up==
1. before we traverse we need to represent the grpah. Do we need to build the graph?
2. Do we need an outer loop? - do we need multiple traversals 
3. code the base BFS or DFS algo
4. code the extensions

## 323. Number of connected components in an undirected graph

[Read notes here](<./323. Number of connected components in an undirected graph.swift>)