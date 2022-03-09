// Course Schedule

// There are n courses to take, they are referred to by numbers from 0 to n-1. Some of them have prerequisites, e.g., courses A and B must be completed before course C can be taken (in other words, course C depends on A and B).

// Find and return an ordering in which all the given courses can be taken while satisfying all the prerequisites. If there exists more than one such ordering, any one of them would be a correct answer. If no such ordering exists, return a special value: [-1].

// Example

// {
// "n": 4,
// "prerequisites": [
// [1, 0],
// [2, 0],
// [3, 1],
// [3, 2]
// ]
// }
// Output:

// [0, 2, 1, 3]
// According to the input,

// course 0 must be done before both 1 and 2,
// courses 1 and 2 must be done before course 3.
// There are two orderings in which one can take all four courses: [0, 2, 1, 3] and [0, 1, 2, 3]. Either is a correct answers.

// Notes

// Prerequisites are given as a list of pairs: a list of lists where each inner list has exactly two elements. Each pair [X, Y] represents one prerequisite: course Y has to be completed before X can be taken (X depends on Y, in other words).

// Function must return a list of integers. If all given courses can be taken while satisfying all given prerequisites, the returned array must contain any of the possible orderings. Otherwise, the function must return [-1].

// Constraints:

// 1 <= n <= 10000
// 0 <= number of prerequisites <= 10000


func course_schedule(n: Int, prerequisites: [[Int]]) -> [Int] {

    return []
}


I'm thinking an adjacency list that way we can get a of requirements per course.

0 | []
1 | [0]
2 | [0]
3 | [1, 2]

The thing is the courses don't have to be in numeric order. So what do we do with the adjacency list afterwards?

what if it was 

[1, 10],
[2, 0],
[3, 1],
[3, 30]

"x" depends on "y"

10| []
30| []
0 | []
1 | [10]
2 | [0]
3 | [1, 30]

That also means "y" might not have any depends but still needs to be in the list

1. Can it be modeled as a graph?
	- My gut says use an adjacency list
2. Would a simple traversal help? If so which one?
	- I don't see how BFS or DFS helps.
	- Drawing a tree let me see this is a BFS because the order is layer by layer when drawing dependent connections
3. what extension do we need?
	- does course require another course to be completed if dig into that course tree

Let's try it at the simplest level

[1, 2]
[0, 1]

Order: [2, 1, 0]

list = course : [dependents]

# build graph stage

for pre in prerequisites 
	// it's always going to be x,y
	x = pre.first
	y = pre.last
	list[x].append(y)
	list[y] // make sure it exists?

