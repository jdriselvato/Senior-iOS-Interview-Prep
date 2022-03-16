Shortest Path In 2D Grid With Keys And Doors

Given a two-dimensional maze represented by a character grid, find the shortest path from start to goal cell. You can move vertically or horizontally—but not diagonally—one step at a time.

There are six types of cells:

'@' for start
'+' for goal
'.' for land
'#' for water
uppercase letter for door
lowercase letter for key
There's exactly one start and one goal cell. Other cells may appear any number of times. Water can never be visited. A door cell can only be visited after visiting a matching key, e.g. key 'a' for door 'A'. Other cells can be visited unconditionally. It is allowed to visit a cell more than once.

Example

```
{
"grid": [
"...B",
".b#.",
"@#+."
]
}
Output:

[
[2, 0],
[1, 0],
[1, 1],
[0, 1],
[0, 2],
[0, 3],
[1, 3],
[2, 3],
[2, 2]
]
```

We start at [2, 0] where the start (@) is located, then we go up to [1, 0] where the adjacent piece of land (.) is, and so on. We visit the following cells on the way:
@ → . → b → . → . → B → . → . → +

To get to the goal we have to walk through door 'B', and for that we have to pass by the matching key 'b' first. We do all of that in the smallest number of steps possible.

Notes

Input is a list of strings. First character of the first string is cell [0, 0] of the maze, the top-left corner. The second character of that string is cell [0, 1] of the maze.
Output is a two-dimensional array of integers with the coordinates of the cells on the shortest path from the start cell to the goal.
The first cell in the output must be the start cell and the last must be the goal cell.
If there are multiple shortest paths, return any one.
We guarantee there will be a path from start to goal.
Constraints:

1 <= width of the maze <= 100
1 <= height of the maze <= 100
'a' <= key <= 'j'
'A' <= door <= 'J'
Multiple keys and doors of one type are possible

---

// BFS - minimum path

|change|a|b|c|d|e|f|g|h|j|
|-|-|-|-|-|-|-|-|-|-|
||0|0|0|0|0|0|0|0|0|
|OR| | | | | | | | | |
||0|1|0|0|0|0|0|0|0|
|now b is filled| | | | | | | | | |

It's multi-dimensional BFS where:

1. shortest path to "b"
2. shortest path to + sign
 
```
func find_shortest_path(grid: [String]) -> [[Int]] {
    // Write your code here.
    return []
}
```

