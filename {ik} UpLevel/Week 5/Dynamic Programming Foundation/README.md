# Dynamic Programming Foundation

## Dynamic Programming Introduction

<details>
  <summary>View Notes</summary>

**Definition:** DP is recursion without repetition

**Fib Example:**

*Original:*

``` swift
func fib(n: Int) -> Int {
	if n == 0 || n == 1 {
		return n
	}

	return fib(n-1)+fib(n-2)
}
```

![fib tree](./fibTree.png)

- We can notice that in this tree there is repeating fib(3), feb(2), etc
- Many sub-problems appear multiple times

**Goal:** Avoid repeated work; each subproblem must be evaluated only once

**Expectations:** The naive recursive implementation took exponential time
	- because of the repeated work. 
	- Avoiding the repeating work should make execution much faster
	- Current state: expontial time

### Introduciton Quiz:
> The Tribonacci sequence Tn is defined as follows:
> T0 = 0, T1 = 1, T2 = 1
> Tn = Tn-1 + Tn-2 + Tn-3
> Consider the following recursive code which implements the mathematical definition:
>
> What is the running time complexity of this implementation?

**A:** Some exponential in n

</details>





## Top-down Memoization

<details>
  <summary>View Notes</summary>


![fibTree2](./fibTree2.png)


*Original:*

``` swift
func fib(n: Int) -> Int {
	if n == 0 || n == 1 {
		return n
	}

	return fib(n-1)+fib(n-2)
}
```

- The original code was done ina depth first search
- Traversal can be done in in-order, pre-order and post-order
 
What if we stored the result in a hash map:

| key | f(n) = v |
|-----|----------|
| 2   | f(2) = 1 |

- This is called memorandum or memo; something to be remembered but in CS it's called Memoization

``` swift
var memo = [Int: Int]() // hashmap

func fib(_ n: Int) -> Int {
	// it's stored so use it
	if let value = memo[n] {
		return value
	}

	// compute fib(n)
	if n == 0 || n == 1 {
		return n // these are leaf nodes, so no need to store these
	}

	memo[n] = fib(n-1)+fib(n-2)
	return memo[n]!
}
```

**Steps from above code:**
1. we check if it's stored
2. Compute `fib(n)` & store it

**Alternative**

``` swift
var memo = [Int: Int]() // hashmap
memo[0] = 0
memo[1] = 1

func fib(_ n: Int) -> Int {
	// it's stored so use it
	if let value = memo[n] {
		return value
	}

	memo[n] = fib(n-1)+fib(n-2)
	return memo[n]!
}
```

- Still a top-down following DFS 

**Time Complexity:** `O(n) func`

**Space Complexity:** `O(n)` because of memo
	- space trade off for better T(n)

![dai1](./dai1.png)

---

### Top-down Memoization Quiz:

> **Q-1:** What is the running time complexity of this code for calculating the nth Tribonacci number, in terms of n?

**A:** Linear

> **Q-2:** Dynamic programming has the potential to transform exponential-time algorithms to polynomial time.

**A:** True - This was shown via the example of calculating fib(n) or tribonacci(n). 

![slide_22.jpg](./slide_22.jpg)

I got Q-2 wrong, so here's an examply of all the `T(n)`
- Polynomial time is `n^k`
- Exponential time is `2^n`

> **Q-2:** Memoization can only be done by using a hash table data structure, not a simple array. 

**A:** False - As long as it's accessable via constant time, it won't be an issue

### End of section summary:

1. Using memoization we can drastically cut down run time
2. In the case of Fib originally being exponential we were able to cut it down to linear
3. Memoization can be Hash table or array, constant time access is key
4. This was a top-down memoization meaning we check memo at the start of DFS
	- but add it to memo when returning the value back up

Simplest example:

``` swift
var memo = [Int: Int]()

func dfs(_ n: Int) -> Int {
	if let val = memo[n] { return val }

	// some case when n isn't set

	memo[n] = dfs(n)
	return memo[n]!
} // this is an inf loop but just the idea
```

</details>





## Bottom up Tabulation

<details>
  <summary>View Notes</summary>

- A bottom up soltion - prefered by most interviewers
	- and will be what is used most of the time at IK
- Tabulatoin - bottom-up

*Original:*

``` swift
func fib(n: Int) -> Int {
	if n == 0 || n == 1 {
		return n
	}

	return fib(n-1)+fib(n-2)
}
```

^ exponental

*Dependency graphs - Bottom up:*

- "collapse" them into unique nodes
	- No longer using recursion trees but instead using dependency graphs
- A directed graph and Acyclic
- `Acyclic` - because each node only depends on smaller problems
	- it'll never have a cycle
- Making this a `DAG` -> `Dependency Acyclic Graph`

![dai2](./dai2.png)

**Topological Sort:** When we have a `DAG` we can sort the vertices of the graph so that the edges are going in a single direct (left to right).

**Steps:**
1. Calculate the values of `Fib()` in `Top sort order`
2. Then cache them
3. Then return table[n]

![dai3](./dai3.png)

- Now we can calculate this iteratively, bottom up

``` swift
func fib(_ n: Int) -> Int {
    if n == 0 || n == 1 { return n } // base case
    
    // Initialize cache
    var table = [Int?](repeating: nil, count: n+1)
    table[0] = 0 // constants
    table[1] = 1 // constants
    
    for i in 2...n { // loop
        guard let a = table[i-1], let b = table[i-2] else { continue }
        table[i] = a + b
    }
    return table[n]!
}
```

**Time Complexity:** `O(n)` the for loop

**Space Complexity:** `O(n)` cause O(n) space to cache results

---
**Thoughts**

It feels the Top sort variation is really complicated since swift requires optional checks in order to assign a `table[i]`.

I ran a speed test agains both Top sort and memoization and memoization comes on top as well: [Speed test](<./memoize\ vs\ top\ sort\ fib.swift>)

Regardless, from my bits of research, it seems the reason top sort or bottom up versions are better is because it is more stable. The problem with memoization is it requires stack space and is prone to stack overflow since we are using DFS.

|	| Pros| Cons |
|----|--------------------|-----|
|Memoization / Top down / (DFS) | Simple to write. | requires stack space. prone to stackoverflow.|
|Top sort / bottom up | allocate exact memory usage | complicated to write in swift |

---

**Additional efficiency**

- What if we were able to limit the caching size? 
	- We know since it's top up we can limit the amount of memory required after passing data forward

1. Initially we have:
`[fib(0)][fib(1)][fib(2)]`

2. For `fib(3)` we only need `[fib(1)]` & `[fib(2)]`

fib(3) can be stored at index 0:
`[fib(3)][fib(1)][fib(2)]`

3. for `fib(4)` we need `[fib(3)]` & `[fib(2)]`

fib(4) can be stored at index 1:

`[fib(3)][fib(4)][fib(2)]`

4. then for `fib(5)` we need `[fib(3)]` & `[fib(4)]` and we can store it at i = 2

`[fib(3)][fib(4)][fib(5)]`

5. etc

The pattern is as such:
1. Index-0: multiples of 3 or `i % 3 = 0`
2. Index-1: if `i % 3 = 1`
3. Index-2: if `i % 3 = 2`

``` swift
func fib(_ n: Int) -> Int {
    if n == 0 || n == 1 { return n } // base case
    
    // Initialize cache
    var table = [Int?](repeating: nil, count: 3) // only 3
    table[0] = 0 // constants
    table[1] = 1 // constants
    
    for i in 2...n { // loop
        guard let a = table[(i-1)%3], let b = table[(i-2)%3] else { continue }
        table[i%3] = a + b
    }
    return table[n%3]!
}
```

**Time Complexity:** `O(n)` the for loop

**Space Complexity:** `O(1)` cause table size is 3 or constant, 1

### Bottom-up Tabulation Quiz 

> **Q-1:** The nth Tribonacci number can be calculated in O(n) time and using no more than O(n) space. 

**A:** True

> **Q-2:** The nth Tribonacci number can be calculated in O(n) time and using only O(1) space. 

**A:** True

> **Q-3:** Bottom-up tabulation works by

**A:** Transforming recursive calls to a loop. Instead of a recursive implementation of f(n), we have a for loop. 


### End of section summary:

1. Top Sort / Bottom up is faster when limiting cache size (it seems)
2. Bottom up is safer because recursion is prone to stack space stackoverflows
3. With limiting cache size we can have constant space complexity

</details>



## Climbing `n` stairs

<details>
  <summary>View Notes</summary>

By using decrease and conquer we can break the problem into smaller parts.

1. 1 steps have 1 variation
2. 2 steps have 2 variations
3. 3 steps have 3 variations

![dai4](./dai4.png)

From those three whiteboard drawings we can see a pattern and apply that into forming a theory; Can these three be enough to solve any `n` step problems? Why?
- I believe 4 is going to look like three but with one additional 1 step to 4 step jump. There's a visual pattern I can see. It wouldn't look exactly like two `2s` because there would be a jump between 1st step and third step. 

Turns out this is the exact same math as the fibonacci sequence.

- 1 step or 2 steps no other ability to step. 
	- which I think I understand it as `n-1 -> n` & `n-2 -> n` 
	- Why n-1 or n-2?
		- is it because the last move is 1 for 1+1+1+1
		- and the last move for 2 is 2+2+2+2

![dai5](./dai5.png)
The math ^

So the function is nearly the same. The difference being we don't start at zero and we set `1` & `2` as a base case instead of `0` & `1`

``` swift
func stairCounter(_ n: Int) -> Int {
    if n == 1 || n == 2 { return n }
    
    var table: [Int?] = Array(repeating: nil, count: n+1) // plus 1 because starts at 0 and we need 5 open spots
    table[1] = 1
    table[2] = 2
    
    for i in 3...n { // starting at 3 since 1 and 2 are base cases
        guard 
            let a = table[(i-1)%3], let b = table[(i-2)%3] // same as fib
        else { continue }
        table[i%3] = a + b
    }
    
    return table[n%3]!
}
```

**Time Complexity:** `O(n)` the for loop

**Space Complexity:** `O(1)` cause table size is 3 or constant, 1

### Climbing `n` stairs Quiz 

> **Q-1:** TYou are climbing a staircase. It takes n steps to reach to the top (n > 3). Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top? Pick the appropriate recurrence equation:

**A:**

f(n) = f(n-1) + f(n-2), f(0) = 1, f(1) = 1

f(n) = f(n-1) + f(n-2), f(1) = 1, f(2) = 2

> **Q-2:** You are climbing a staircase. It takes n steps to reach to the top (n > 3). Each time you can either climb 1, 2 or 3 steps. In how many distinct ways can you climb to the top? Pick the appropriate recurrence equation with base cases:

**A:** f(n) = f(n-1) + f(n-2) + f(n-3), f(0) = 1, f(1) = 1, f(2) = 2
f(3) should be 4. This means f(0) + f(1) + f(2) = 4. So #4 is the right equation. 

> **Q-3:** How many distinct permutations of the numbers 1 and 2 (in which repetition is allowed) add up to n? Assume that n > 2. For example, if n = 4, the permutations are 2-2, 1-1-2, 1-2-1, 2-1-1, 1-1-1-1. 
> Suppose f(n) = The number of such permutations. 
> Pick the recurrence equation for f(n):

**A:** f(n) = f(n-1) + f(n-2)

**Solution:** 
If we visualize each permutation as a sequence of blanks, the last blank for any of those permutations can be either filled with a 1 or 2. Fo if f(n) is the number of permutations of 1s and 2s adding up to n, it can be split as the number of permutations adding up to n-1 followed by a 1 at the end + the number of permutations adding up to n-2 followed by a 2 at the end. So f(n) = f(n-1) + f(n-2)

This makes total sense because if you add up all the last permutations ending in 2 == n-2 == 2 and all the perms ending in 1 == n-1 = 3

`if n = 4, the permutations are 2-2, 1-1-2, 1-2-1, 2-1-1, 1-1-1-1`

So if we think about the steps problem again, we looked at the final stage of steps, "the ending". The ending ended with either 1 step or 2 steps. If there was a 3rd step, it would be n-3.

### End of section summary:

1. we took a counting problem
2. with decrease and conquer we found a recurrence equation
3. with DP, we implimented a recursive / iterative implementation w/o repetition
	- which turned out to be the same as fib

### Personal thoughts:

~~I kind of get how we got i-1 & i-2 for the steps but I doubt I understand it enough to figure it out on another problem.~~

See what I wrote in `Q-3` but summary: We can look at the final literal step of what is possible. So in the 2 stairs problem, we knew that final move up the staircase would either be 1 step or 2 steps. So n-1 and n-2 respectively. If the child could jump 3 steps, the ending would also have 3 or n-3.

</details>




## Counting subsets of size k

<details>
  <summary>View Notes</summary>

![dai6](./dai6.png)

Using pascals triangle we can determine the k elements out of a set of n elements.

For example, we have a class room of n students and we want groups of k students. Within each group, order doesn't matter and a student can only belong in a single group.

By using the lazy manager strat, we only make a decision about the 1st student.

This type of counting subsets of size k is visually seen as `c(n,k)` or `n choose k`

`c(n,k) = c(n-1) + c(n-1, n-k)`

**Refresher on pascals triangle**
- To get any value in the triangle, you add the previous two above it.

In the above diagram, `c(4, 2) = c(3, 1) + c(3, 1)` or `6 = 3 + 3`


Original recursive example:

``` swift
func c(_ n: Int, _ k: Int) -> Int {
	// base case
	if k == 0 || k == n { return 1 }

	// recursive case
	return c(n-1, k) + c(n-1, k-1)
}
```

**Time Complexity:** `O(2^n)` 
(n, 0) + (n, 1) + (n, 2) ... (n, n) = 2^n

---

We can see in the diagram that:
- the outside edge has `1` going all the way down both sides.
- the repition of `3` & `4` are visible
- there is probably a battern with middle even numbers `2` and `6`, lets try it

```
        1
       1 1
      1 2 1
     1 3 3 1
    1 4 6 4 1
  1 5 10 10 5 1
1 6 50 100 50 6 1
```

There might even be a pattern in counting:
- cause we can see a 1's on the left and right edge
- then the second diagonal from left to right || right to left shows: `1, 2, 3, 4, 5 6`
- but the line after seems to have a weird pattern `1,3,6,10,50`
- regardless, there is this triangle pattern with each inner pattern that should be taken care of in DP

### End of section summary:

- Seeing the pattern is important but also identifying the time complexity inorder to explain the benefit of DP.



</details>
