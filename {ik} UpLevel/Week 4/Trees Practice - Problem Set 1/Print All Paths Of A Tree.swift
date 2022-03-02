// Print All Paths Of A Tree

// Given a binary tree, return all paths from root to leaf.


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

func all_paths_of_a_binary_tree(root: BinaryTreeNode?) -> [[Int]] {
	guard let root = root else { return [] }

	var result = [[Int]]()
	var slate = [Int]()

	func helper(root: BinaryTreeNode?, slate: inout [Int]) {
		guard let root = root else { return }

		if root.left == nil && root.right == nil {
			result.append(slate)
			return
		}

		if let left = root.left {
			slate.append(left.value)
			helper(root: left, slate: &slate)
			slate.removeLast()
		}

		if let right = root.right {
			slate.append(right.value)
			helper(root: right, slate: &slate)
			slate.removeLast()
		}

	}

	slate.append(root.value)
	helper(root: root, slate: &slate)
	slate.removeLast()

    return result
}

let head = BinaryTreeNode(value: 1)
head.left = BinaryTreeNode(value: 2)
head.left?.right = BinaryTreeNode(value: 5)
head.left?.left = BinaryTreeNode(value: 6)
head.right = BinaryTreeNode(value: 3)
head.right?.right = BinaryTreeNode(value: 4)

let spath = all_paths_of_a_binary_tree(root: head)
print(spath)