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
	if preorder.isEmpty { return nil }
	if preorder.count == 1 { return BinaryTreeNode(value: preorder[0]) }

    func buildBST(_ root: inout BinaryTreeNode?, _ preorder: [Int], _ index: Int) -> BinaryTreeNode? {
    	if index == preorder.count { 
    		print("Counted over", index)
    		return nil 
    	}

		if root == nil {
			root = BinaryTreeNode(value: preorder[index])
		}

		guard let root = root else { return nil }

		if root.value < preorder[index] {
			let left = buildBST(&root.left, preorder, index+1)
			print("root.value \(root.value) is greater", left?.value)
			root.left = left
		} else {
			let right = buildBST(&root.right, preorder, index+1)
			print("root.value \(root.value) is lesser", right?.value)
			root.right = right
		}

    	return root
    }

    let startIndex = 0
    var root: BinaryTreeNode? = BinaryTreeNode(value: preorder[startIndex])

    return buildBST(&root, preorder, startIndex)
}

_ = build_binary_search_tree(preorder: [5713276, -100, -1000000000, 0, 6000000, 1000000000])
