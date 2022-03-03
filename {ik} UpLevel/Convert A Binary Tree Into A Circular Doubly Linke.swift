// Convert A Binary Tree Into A Circular Doubly Linked List

// Given the root node of a binary tree, convert it into a circular doubly linked list in-place. The left and the right pointers in nodes are to be used as previous and next pointers, respectively, in the structure that you return.

// Returned list should follow the in-order traversal order of the given tree.

// The "root" node that you return should be the first node in the in-order traversal order. That "root" node should be connected with the last node in the in-order traversal as if "root" node goes after the last node and last node goes before the "root" node.

// Notes

// Constraints:

// 1 <= number of nodes <= 105
// -109 <= node value <= 109
// Description of the text format of the test cases

// You might need this for debugging your solution on IK UpLevel platform.

// Input file contains the given tree in the usual binary tree format.

// Output file lists node values of the returned data structure:

// starting from the returned node,
// following right pointers until we reach the last node in the list,
// then following left pointers until we come back to the root node.


/*
For your reference:
final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}
*/
func binary_tree_to_cdll(root: BinaryTreeNode?) -> BinaryTreeNode? {
	var result: BinaryTreeNode?
	var previous: BinaryTreeNode?

	func bfs(root: BinaryTreeNode?) {
		guard let root = root else { return }

		if let left = root.left {
			bfs(root: left)
		}

		// set our tree root
		if result == nil {
			result = root
		}

		// set previous & connect
		if let prev = previous {
			prev.right = root // next
			root.left = prev // last
		}

		previous = root

		if let right = root.right {
			bfs(root: right)
		}
	}

	bfs(root: root)

	// connect root's left to last tree leaf
	if let result = result {
		result.left = previous
	}

	// connect last tree leaf to root
	if let previous = previous {
		previous.right = result
	}

    return result
}
