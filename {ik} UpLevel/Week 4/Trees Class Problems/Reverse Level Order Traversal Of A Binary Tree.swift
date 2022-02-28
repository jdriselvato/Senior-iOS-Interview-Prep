// Reverse Level Order Traversal Of A Binary Tree

// Given a binary tree, return the bottom-up level order traversal of the node values listing each level from left to right.



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
func reverse_level_order_traversal(root: BinaryTreeNode?) -> [[Int]] {
	guard let root = root else { return [] }

	var result = [[Int]]()


	var queue = [BinaryTreeNode]()
	queue.append(root)

	while !queue.isEmpty {
		var temp = [Int]()
		var count = queue.count

		while queue.count > 0 {
			guard let node = queue.first else { break }
			temp.append(node.value)
			count -= 1

			if let left = node.left {
				queue.append(left)
			}

			if let right = node.right {
				queue.append(right)
			}

			queue.removeFirst()
		}
		result.append(temp)
	}

	return result.reversed()
}
