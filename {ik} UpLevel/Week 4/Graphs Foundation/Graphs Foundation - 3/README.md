# A general way to traverse a graph

## General Graph Search

- With the way fringe edges work the algorthm gives us a search tree.
- The set of captured vertices == the set of reachable nodes from "S"

Search tree:
- P --> C (parent captured the child)

Two buckets:
- Captured and yet to be captured

## Graph Algorithms Template

This words for directed or undirected graphs
- Where things differe is the "Policy" of which fringe to pull on

Template of search:

``` c++
class Graph {
	func search(s: Int) {
		// captured and parent init to 0 & nil
		captured[s] = 1
		while fringe edge exists {
			// pick one => (u,v)

			captured[v] = 1
			parent[v] = u
		}
	}
}
```

## 6 types of graph algorithms

| Algorithm      | Policy | Search Tree     |
| :---        |    :----:   |          ---: |
| Breadth-first search (BFS)      | Choose the fringe edge that was seen first.       | BFS Tree  |
| Depth-first search (DFS)   | Choose the fringe edge that was seen last (most recent)        | DFS      |
| Dijkstra's   | Choose the fringe edge whose RHS vertex has the smallest numerical label (single label)       | Shortest path tree      |
| Prim's   | Choose the fringe edge whose RHS vertex has the smallest numerical label (single label)        | Minimum spanning tree (MST)     |
| Best-frist Search   | Choose the fringe edge whose RHS vertex has the smallest numerical label (single label)       | Best-first search tree      |
| A*   | Similar, except that vertices have two labels which need to be added        | A* tree     |

He says they all share the same pattern but the policy is different. So if we can learn the foundation, it's just swapping the correct policy as needed.

----

# BFS Requirements

- explroe the graph in increasing order of distance from "S"
- Steps:
	- 1st capture the immediate neighbors of "S" (one hop away)
	- then capture their neighbors (Two hops)
	- etc

Helpful for finding how many hops until reaching "S"
- for example, a disease spreading and what day will you get the disease from your neighbor?

# BFS Need for a Queue

- Using a queue to prioritize which vertex to capture first
- FIFO

# BFS Handling Cycles

![cycle](./cycle.png)

- In the change that a graph has a cycle, we don't want to add the same vertex to a queue twice.

**Q:** A vertex should only be added to a queue once. How do we prevent double captures?
**A:** We keep an array of "visited" vertexs and check against that.
	- Vertexs are visited first then captured

# BFS Pseudocode and BFS tree

Modify the template pseudocode for BFS

``` c++
class Graph {
	func BFSearch(s: Int) {
		// captured and parent init to 0 & nil
		var captured[s] = 1 // source
		var visited[s] = 1 // discovered but not captured

		// use a queue 

		var q = [Int]() // vertexObj
		q.append(s) // source index

		while !q.isEmpty {
			// pick one => (u,v)
			guard let v = q.last else { return }
			captured[v] = 1

			for w in adjlist[v] {
				if visted[w] == 0 {
					visited[w] == 1
					parent[w] == v
					q.append(w)
				}
			}
		}
	}
}
```

### Example:

Breadth-First Search - Exploring the world with a bird's eye view

![graph2BFSTree](./graph2BFSTree.png)

- Every cross edge has a cycle in a BFS tree

----

## DFS and the need for a LIFO Stack

- instead of going broad, go deep as possible and only retreat backtrack when needed
- if a graph represents a *maze*, think of how you would try to get out of a maze
	- if we meet a dead end we go backward and try a new path
- We want to use a `Last in First Out structure` (stack)

## DFS: Stack-based implementation

``` c++
class Graph {
	func DFSearch(s: Int) {
		// captured and parent init to 0 & nil
		var captured[s] = 1 // source
		var visited[s] = 1 // discovered but not captured

		// use a queue 

		var stack = [Int]() // vertexObj
		stack.append(s) // source index

		while !stack.isEmpty {
			// pick one => (u,v)
			guard let v = stack.first else { return }
			captured[v] = 1

			for w in adjlist[v] {
				if visted[w] == 0 {
					visited[w] == 1
					parent[w] == v
					stack.append(w)
				}
			}
		}
	}
}
```

- Here we use a stack instead of a queue with LIFO
- But it's recommended to use recursion

## DFS: Recursive implementation

Template:
``` c++ 
class graph {
	func DFS(s: Int) {
		visited[s] = 1
		for w in adjList[s] {
			if visited[w] == 0
				DFS(w)
		}
	}
}
```

- visited and captured mean the same thing in DFS, why?
- keeps going deep until it meets a dead end and returns back to for loop

**Q:** How to keep track of a parent?

``` c++ 
class graph {
	func DFS(s: Int) {
		visited[s] = 1
		for w in adjList[s] {
			if visited[w] == 0
				parent[w] = s
				DFS(w)
		}
	}
}
```

==^ why does this matter? Not sure==

- Time Complexity: O(degree(v)) O(m), so O(n + m)

- When we find a vertex that points to a previous visited vertex, this indicates a cycle

------

## Finding connected components of a graph

**Q:** How to determine if a graph is connected or not?

**Q:** If not connected, can we find all the connected components? 

``` c++ 
class graph {
	// s == source
	// c == components
	func DFS(s: Int, c: Int) {
		visited[s] = c

		for w in adjList[s] {
			if visited[w] == 0
				parent[w] = s
				DFS(w, c)
		}
	}

	func findComponents() {
		component = 0
		for i in 1 to V {
			if visited[i] == 0 {
				component +=. 1
				DFS(i, component)
			}
		}

		return component
	}
}
```

![components](./components.png)

When 1 traverse the graph, we'll see that `1, 2, 5 & 7` are visited but `3, 4, & 6` are not. So the graph are not connected. 

- So how do we know which components are connected? (not in image above `6` is not connected to `3 & 4`).
	- Do a DFS from a vertex to return a component count.
	- in this example `DFS` was launched `3` times.

We can tag in the array a different `Int` as seen below:

![differentGraphs](./differentGraphs.png)

- the highest number in the array would tell you the number of components. 

NOTE: ==We could do this with BFS as well==

