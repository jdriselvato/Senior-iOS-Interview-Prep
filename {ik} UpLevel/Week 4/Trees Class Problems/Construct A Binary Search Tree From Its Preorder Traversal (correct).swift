// Construct A Binary Search Tree From Its Preorder Traversal
//
// Construct a Binary Search Tree whose preorder traversal matches the given list.
//
// input:
// {
// "preorder": [1, 0, 2]
// }

// Notes
//
// Constraints:
//
// 1 <= size of the given list <= 105
// -109 <= number in the list <= 109
// Numbers in the given list are unique


/*
For your reference:
*/

final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}


func build_binary_search_tree(preorder: [Int]) -> BinaryTreeNode? {
	guard !preorder.isEmpty else { return nil }

	var index = 0
	func bst(_ preorder: [Int], _ index: inout Int, _ min: Int, _ max: Int) -> BinaryTreeNode? {
		if index == preorder.count { return nil }

		let value = preorder[index]
		if value > max || value < min { return nil }

		index += 1

		let root = BinaryTreeNode(value: value)
		root.left = bst(preorder, &index, min, root.value-1)
		root.right = bst(preorder, &index, root.value+1, max)

		return root
	}

	return bst(preorder, &index, -1000000000, 1000000000) // the problem gives us these bounds
}

_ = build_binary_search_tree(preorder: [5713276, -100, -1000000000, 0, 6000000, 1000000000])
