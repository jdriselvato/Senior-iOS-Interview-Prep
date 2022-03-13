# Live Dynamic Programming Class with Tilo

## Class Agenda: 

1. Permutation-style problems (e.g, Rod cutting)
2. Combination-style problems (e.g, Knapsack or Subset Sum)
3. Permutation-style problems on TWO inputs (e.g, Edit Distance)


## Dynamic Programming - theory to solve problems

<details>
  <summary>View Notes</summary>

There are 2 formal properties of DP:

1. Optimal Substructure:
	- the solution to the subproblem doesn't change
	- if it doesn't change, we can store it (memoize it)
2. Overlapping subproblems:
	- the solution to at least one subproblem is used more than once
	- memoization is a good use of memory
		- pascals triangle (it's a directed graph)

- Recursion is implied.

### Solving DP prolems in an interview:

- missing a DP problem doesn't make you stand out
	- it shows you are confident in coding
	- rushing to a recursion solution and programming means you may have missed the DP
		- which means maybe the problem was too easy and might make the next question they give you even hearder
- it's better to have an opinion than ask if you should use DP

a. writing code in *recursion* and you notice repeating structures
	- memoization (but has short coming)
		- `is it computed use it or not, if not store it`
	- bottom up
b. start by reasoning about the structure of the *recursive* PD table
c. write a recurrence (*recursive* formula) by using from proof by induction

- *recursion* is at heart of DP

What if we can't figure out the recursive solution?

### Solving *hard* problems in 45 minutes

Stages of problems:

1. Easy: you know what to do
2. Medium: I know some patterns that can be tried
3. Hard: No immediate idea

- just throwing out an idea or pattern means nothing

### How to get out of panic mode *(Mainly for DP)*

- Stay calm and take an inventory of what I *do* know
	- Examples:
		- problem size can be reduced
		- solution for a special case / small case is obvious
	- Typical DP questions contain words:
		- counting
		- optimization (min, max)
		- validate the structure (there's a rule does the input follow that rule?)
- Solve examples:
	- you have the time don't skip it
	- treat every example as a puzzle
		- every example can be solved by a 12 year old
	- use the language of the problem 
	- if you suspect DP, do examples small to large

<details>



## American Football scores

<details>
  <summary>View Notes</summary>

### American Football scores

Possible scores: [2, 3, 6]

Question: Given a final score "S", how many ways are there to reach "S"

Example: 

```
S = 7

1. 2->2->3
2. 2->3->2
3. 3->2->2

Answer: 3
```

1. Can the problem size be reduced?
	- s = 5 and 2+3 or 3+2, so 2
	- s = 2 and 2, so 1 but too little info because of s = 3 then the answer isn't possible
	- keep using the language "american football" and "score"

2. Do self example problems:

| score   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---------|---|---|---|---|---|---|---|---|---|
|# of ways| 1 | 0 | 1 | 1 | 1 | 2 | 3 | 3 | 6 |

- how many of 0? 
	- initially I thought 0 because of the language of the problem
	- a game can end with no points

- 6 = 6, 2+2+2, 3+3 = 3
- 7 = 2+2+3, 2+3+2, 3+2+2 = 3 

3. How did we solve it using examples?
	- and formulate an algo to do the same thing we did as a humman
	- for DP find the recursion <- if i can do this I'm done

Solving for 8 using previous answers
- using the scores what scores previously occurred and take their count

```
8-2=6 [2->2-2]->2 = 8
	  [3->3]-> 2 = 8
	  [6]->2 = 8

8-3=5 [2->3]->3
	  [3->2]->3

8-6=5 [2]->6 

Total: 6
```

So we can formulate:
`row(s) = row(s-2)+row(s-3)+row(s-6)`

wrap this into a loop and we have the answer.

<details>