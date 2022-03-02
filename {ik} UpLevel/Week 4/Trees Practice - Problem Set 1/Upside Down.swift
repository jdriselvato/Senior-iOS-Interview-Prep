// Upside Down

// Given a binary tree where every node has either 0 or 2 children and every right node is a leaf node, flip it upside down turning it into a binary tree where all left nodes are leafs.


// For your reference:

final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}

// func flip_upside_down(root: BinaryTreeNode?) -> BinaryTreeNode? {
// 	guard let root = root else { return nil }
// 	if root.left == nil && root.right == nil { return root }

// 	// Since the upside down tree looks like a post order array, make a postorder array
// 	var postOrder = [Int]()

// 	func postOrderIt(root: BinaryTreeNode?) {
// 		guard let root = root else { return }

// 		postOrderIt(root: root.left)
// 		postOrderIt(root: root.right)

// 		postOrder.append(root.value)
// 	}

// 	postOrderIt(root: root)

// 	// Convert postOrder array into a tree
// 	let inOrder = postOrder.sorted()



//     return nil
// }

func flip_upside_down(root: BinaryTreeNode?) -> BinaryTreeNode? {
	guard let root = root else { return nil }
	if root.left == nil && root.right == nil { return root }

	// Since the upside down tree looks like a post order array, make a postorder array
	// var postOrder = [Int]()

	var upSideDown: BinaryTreeNode = root

	func postOrderIt(root: inout BinaryTreeNode?, previous: BinaryTreeNode?) {
		guard let root = root else { return }

		postOrderIt(root: root.left, previous: root)
		postOrderIt(root: root.right, previous: root)

		let node = root
		guard let left = root.left {
			root = left
			root.right = node
		}

		guard let right = root.right {
			root.left = right
		}

	}

	postOrderIt(root: upSideDown, previous: nil)

	// Convert postOrder array into a tree
	// let inOrder = postOrder.sorted()



    return upSideDown
}

let head = BinaryTreeNode(value: 1)
head.left = BinaryTreeNode(value: 2)
head.right = BinaryTreeNode(value: 3)

let _ = flip_upside_down(root: head)

// inorder: [1, 2, 3]
// preorder: [2, 3, 1]

