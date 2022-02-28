// Is It A BST

// Given a binary tree, check if it is a binary search tree (BST). A valid BST does not have to be complete or balanced.

// Consider this definition of a BST:

// All nodes values of left subtree are less than or equal to parent node value.
// All nodes values of right subtree are greater than or equal to parent node value.
// Both left subtree and right subtree must be BSTs.
// NULL tree is a BST.
// Single node trees (including leaf nodes of any tree) are BSTs.

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

func is_bst(root: BinaryTreeNode?) -> Bool {
	guard let root = root else { return true }

	func helper(_ root: BinaryTreeNode?, _ min: Int, _ max: Int) -> Bool {
		guard let root = root else { return true } // if it makes it to a leaf without returning false, it's a valid BST

		if let min = min, root.value < min { // if has a min (node.value) && current.value is less than min it's false
			return false // because parent should have a val larger than min
		}

		if let max = max, root.value > max { // if has a max (node.value) && current.value is greater than max it's false
			return false // because parent should have a smaller val than max
		}

		return helper(root.left, min, node.value) && helper(root.right, node.value, max)
	}

	return helper(root, nil, nil)
}