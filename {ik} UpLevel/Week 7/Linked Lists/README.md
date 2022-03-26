# Linked List

### Why are Linked Lists still relevant in interviews?

- It's a fundamental architecture
- It's simple, shows you have technical articulation and it's easy to talk through

### LL VS Array

Linked List:

- Search: O(n)
- Memory management:
	- Dynamic - create on the go
- Performance:
	- We don't know if it's in ram or not
	- no advantage
- Overhead:
	- value and address - minimal overhead
	- value and block - 100% overhead

Array:

- Search (random access): O(1)
	- you know where it is 
- Memory management:
	- static allocation of memory
	- resizing is expensive
- Performance:
	- locality of reference
- Overhead:
	- starting address


# Cycle detection

1. non-cycle: 

`[]->[]->[]`

2. Cycle

```
[]->[]->[]
	 ^	 |
	 |   v
	 []<-[]
```

- introduces data loss and infinite loops

Lowest common denominator:

- one node can point to itself

```
 ___
|	|
v	|
[ ]--

```

### How to keep track of the visited nodes:

1. Brute force: (suboptimal)
	- We need to keep some kind of visiting
	- maybe color the node
		- but you need a clean up
		- what if a node was inserted?

2. External data structure: (suboptimal)
	- hash set
		- unique copy
	- add it to the set of node
		- ask if it's been stored before

3. Not have anything external: (optimal)
	- with two pointers with 2 hops
	- fast and slow pointers where 
		- fast moves 2 nodes 
		- slow moves 1 node

``` swift
func hasCycle(node: LinkedList) {
	var fast = node
	var slow = node

	while (fast && fast.next) { // not nil
		slow = slow.next
		fast = fast = fast.next.next
		if slow == fast { // check after because we init both at node
			return true
		}
	}
	return false
}
```

By the time we are in an inteview this should be memorized

### Wrap up

Other questions that may be asked during the interview after finishing the original question:

1. You found the cycle how to fix it?
	- unwind if the cycle doesn't have more nodes passed it
2. What is the length of the cycle?
3. How do you determine the point where the cycle began?
	- Floyd's algo
	- Brent's algo