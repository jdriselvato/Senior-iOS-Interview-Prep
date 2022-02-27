// 102. Binary Tree Level Order Traversal


public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
		self.val = val
		self.left = left
		self.right = right
	}
}

let tree = TreeNode(3, 
	TreeNode(2, nil, nil), 
	TreeNode(4, nil, nil)
	)

class Solution {
	func levelOrder(_ root: TreeNode?) -> [[Int]] {
		guard let root = root else { return [}

		if root.left == nil && root.right == nil {
			return [[root.val]]
		}

		var result = [[Int]]()

		var queue = [TreeNode]()
		queue.append(root)

		while !queue.isEmpty {
			
			var index = queue.count
			var temp = [Int]()

			while index > 0 {
				guard let node = queue.first else { break }

				index -= 1
				temp.append(node.val)

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

		return result

	}
}

let solution = Solution().levelOrder(tree)
print(solution)
