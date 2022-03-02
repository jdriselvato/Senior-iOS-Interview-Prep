// Construct A Binary Search Tree From Its Preorder Traversal


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

func build_binary_search_tree(preorder: [Int]) -> BinaryTreeNode? {

	func buildBST(_ root: inout BinaryTreeNode?, _ value: Int) -> BinaryTreeNode? {
		if root == nil { 
			root = BinaryTreeNode(value: value)
			return root
		}

        guard let root = root else { return nil }

		if root.value > value {
			root.left = buildBST(&root.left, value)
		} else {
			root.right = buildBST(&root.right, value)
		}
		
		return root
	}

	var root: BinaryTreeNode?

	for num in preorder {
		let _ = buildBST(&root, num)
	}

	return root
}

// This version is O(n^2) which times out on IK. Is there a way we can do this without the for loop?