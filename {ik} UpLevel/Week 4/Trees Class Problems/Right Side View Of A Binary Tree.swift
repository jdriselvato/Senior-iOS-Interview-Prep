// Right Side View Of A Binary Tree

// Given a binary tree, imagine yourself standing on the right side of it and return a list of the node values that you can see from the top to the bottom.


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
func right_view(root: BinaryTreeNode?) -> [Int] {
	guard let root = root else { return [] }

	var queue = [BinaryTreeNode]()
	queue.append(root)

	// create a backwards dfs array
	var dfsArray = [[Int]]()

	while !queue.isEmpty {

		var temp = [Int]()
		var count = queue.count

		while count > 0 {
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

		dfsArray.append(temp)
	}

	var result = [Int]()

	for level in dfsArray { // [Int]
		guard let node = level.last else { return [] }
		result.append(node)
	}

    return result
}

