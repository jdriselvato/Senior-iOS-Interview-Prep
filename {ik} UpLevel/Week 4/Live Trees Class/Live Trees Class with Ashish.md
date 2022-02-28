<!-- Live Trees Class with Ashish -->

Teacher:
- Tech lead at Google
- Ex microsoft / adobe
- Linkedin: https://www.linkedin.com/in/ashish-jindal-80751426/

-------

# Summary Of Preclass Video

Hash tables

### BST:
- Search O(logn)
- insert O(logn)
- Delete O(logn)
- Has order

#### Two borad ways of traversing trees:
- BFS (queue)
- DFS

#### DFS Traversals
- Preorder
- Inorder
- Postorder

#### BFS
- Queue-based iterative

#### How to reconstruct a binary tree
1. preorder + inorder
2. postorder + inorder

# Today's class schedule:

1. Tree Problems
	- Tree Traversals
		- BFS
		- DFS
			- Top down DFS
			- Bottom up DFS
			- Boundary Walk
			- Iterative stalk DFSf
	- Tree Construction
		- Top down
		- Left to right
		- Brute force
		- Divide and Conquer
2. DFS Problems
	- Path Sum
	- Path Sum II
3. Diameter of a Binary Tree
4. Count Univalue Subtree
5. Tree Constructions
	- convert Array to BST

# BFS Tree Patterns

## 102. Binary Tree Level Order Traversal
Q: Given a binary tree, return the level order traversal of its nodes values(from left to right level by level)

Example:
```
Output:
[
	[1],
	[2,3],
	[4,5,6,7]
]
```


```
class TreeNode {
	var left: TreeNode?
	var right: TreeNode?
	var value: Int = 0
}
```

Printing a tree BFS version:

``` Swift
func bfs(root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var queue = [TreeNode]()
    queue.append(root)
    var result = [Int]()
    
    // loop
    while queue != nil {
        guard let node = queue.popLast() else { continue }
        result.append(node.value)
        
        // process node val && result append
        if let left = node.left {
            queue.append(left)
        }
        
        if let right = node.right {
            queue.append(right)
        }
    }
    return result
}
```

but the above doesn't print it level by level as a list array, see:

------

## 429. N-ary Tree Level Order Traversal

Given an n-ary tree, return the level order traversal of its nodes' values.

Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

Example 1:
```
Input: root = [1,null,3,2,4,null,5,6]
Output: [[1],[3,2,4],[5,6]]
```

Example 2:
```
Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
Output: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]
```

Constraints:
- The height of the n-ary tree is less than or equal to 1000
- The total number of nodes is between [0, 104]

This is the same question as the previous but instead we cycle through the array of children instead of left and right.


## 107. Binary Tree Level Order Traversal II

Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

Example 1:
```
Input: root = [3,9,20,null,null,15,7]
Output: [[15,7],[9,20],[3]]
```

This is the same as 102 but we can just reverse the array


## 199. Binary Tree Right Side View

Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

![example](./BinaryTreeRightSideView.png)

Example 1:
```
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]
```

The number of nodes in the tree is in the range [0, 100].
-100 <= Node.val <= 100

The catch here is if the left height is longer than the right height, then we also need to take that into account.

Interview tip:
- At least considering 2 or 3 examples because the test case will always be basic.
- See if you can find pitfalls

Solution:
- The same as the previous 3 using BFS and then use the last element from each array.

How to have intuitively know to do it this way?
- There are only two types of traversal methods
	1. DFS
	2. BFS
- So from there we need to decide which one makes sense.


## 103. Binary Tree Zigzag Level Order Traversal

Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).


Example:
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]
```

Constraints:

The number of nodes in the tree is in the range [0, 2000].
-100 <= Node.val <= 100

My idea of how to solve it:
- I think we can just do the same BFS but mod the level determine which variation of the zigzag we are on
- Another student suggested a boolean that toggles each append to result
- Maybe it just makes sense to reversed() 

Solution:
- The teacher uses a reversed 

```
func zigzag(root: TreeNode) {
	guard let root = root else { return [] }

	var ltor = true // left to right
	while q.count > 0 {
		numNodes = q.count
		temp = []
		while node > 0 {
			node = q.first
			temp.append(node.val)
			if let left = node.left {
				q.append(node.left)
			}

			if let right = node.right {
				q.append(node.right)
			}
		}
		if !ltor {
			temp.reverse()
		}
		ltor = !ltor

		result.append(temp)
	}
	return result
}
```
# DFS Tree Patterns - Top down

Template:

```
def dfs(node):
	if node.left is not None:
		dfs(node.left)
	if node.right is not None:
		dfs(node.right)
```

Template with basecase:

```
def dfs(node):
	if node.left is None and node.right is None:
		# Base case answer generated here

	# recursive case: Internal node
	if node.left is not None:
		dfs(node.left)
	if node.right is not None:
		dfs(node.right)
```


## 112. Path Sum

Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

A leaf is a node with no children.

Example 1:
```
nput: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
Output: true
Explanation: The root-to-leaf path with the target sum is shown.
```

Explaination
- This is "top down" DFS
	* IMPORTANT: Top down is pre-order traversal 


```
func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
	if guard let root = root else { return false }

	var result = false

	helper(root, targetSum)

	return result

}

func helper(_ node: TreeNode?, _ targetSum: Int) -> Bool {
	if node.left == null && node.right == null {
		if targetSum == node.val { // because we are doing subtraction the last targetSum == node.value if it's the correct path
			return true
		}
		return false
	}

	if let left = node.left {
		helper(left, targetSum - node.value)
	}
	if let right = node.right {
		helper(right, targetSum - node.value)
	}

}

```

- Balanced tree: O(logn) or O(h) 
- Unbalanced tree: O(h)

## 113. Path Sum II

Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.

A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

```
Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
Output: [[5,4,11,2],[5,8,4,5]]
Explanation: There are two paths whose sum equals targetSum:
5 + 4 + 11 + 2 = 22
5 + 8 + 4 + 5 = 22
```

Solution:

```
func helper(node: TreeNode?, target: Int, slate: [Int]) {
	# base case

	if node.left == null && node.right == null {
		if target == node.value {
			slate.append(node.value) / / append to ensure the last number is part of the slate
			globalBox.append(slate)
			slate.removeLast()
		}
		return
	}

	# recursive case

	slate.append(node.value)
	if let left = node.left {
		helper(node.left, target - node.value, slate)
	}

	if let right = node.right {
		helper(node.right, target - node.value, slate)
	}
	slate.removeLast()
}
```

Time complexity:
- n/2 * log n = O(nlogn)

# DFS Tree Patterns - Bottom Up

## 543. Diameter of Binary Tree

Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.


```
Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
```

Formula: `LH+RH+2 = Diameter`

Responsibility for each node:
1. compute local solution from LH + RH
2. Complete my own height and pass it to my parent

Solution:

 * Bottom Up DFS

```

// First get height
func getHeight(node) -> Int {
	# base case
	if node.left == nil && node.right == nil {
		return 0
	}

	# recursive case
	myDai = 0
	if node.left!= nil {
		LH = dfs(node.left)
		myDai += LH + 1
	}

	if node.right!= nil {
		RH = dfs(node.right)
		myDai += RH + 1
	}

	return max(LH, RH) + 1 // plus one from the angle from the root
}

globalDia = max(globalDia, my dia)

```

## 250. Count Univalue Subtrees

Given a binary tree, count the number of uni-value subtrees.

A Uni-value subtree means all nodes of the subtree have the same value.

For example: Given binary tree,

```
              5
             / \
            1   5
           / \   \

          5   5   5

 Output: return 4
```

This is a set of questions regarding trees, two pieces of information is needed, the solution is in the return of recursion, return a struct which contains both information.

## 144. Binary Tree Preorder Traversal

Given the root of a binary tree, return the preorder traversal of its nodes' values.

```
Input: root = [1,null,2,3]
Output: [1,2,3]
```

Solution:

```
class Solution { // Iteratively
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var order: [Int] = []
        var stack: [TreeNode] = []
        stack.append(root)

        // The trick on this one is, you're doing right first then left because of the popLast, you want left to append last.

        while !stack.isEmpty {
            if let currentNode = stack.popLast() {
                order.append(currentNode.val)

                if let node = currentNode.right {
                    stack.append(node)
                }

                if let node = currentNode.left {
                    stack.append(node)
                }
            }
        }

        return order
    }
}
```

## 108. Convert Sorted Array to Binary Search Tree

Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

Example 1:

```
Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted
```

Solution: 

- Since the array is sorted, we take the center of the array to ensure the tree is balanced.
- Top down approach

1. find the root -> the middle element, and construct the root
2. construct the left
3. construct the right

```
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
    }

    func helper(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
    	if start > end { return nil }

    	if start == end {
    		return TreeNode(nums[Start])
    	}

    	# recursive

    }
}
```

## 105. [Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

Example 1:

```
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
```


------

* IMPORTANT: After class tips
- When writing for FAANG you need to be writing production ready code
	- Try to think of all the edge cases or issue early not after writing the code
- Once you are done say "I'm done with the bare implimentation" then walkthrough the code. Don't ever say you are done.
- Ask the interviewer if there's any test cases they'd like me to walkthrough
