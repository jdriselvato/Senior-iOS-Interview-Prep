// 3 Types of DFS


/*

pre-order

in-order

post order

*/

Struct TreeNode {
	var left: TreeNode?
	var right: TreeNode?
	var value: Int?
}

func dfs(node: TreeNode) {

	// Printing here is pre-order
	if let left = node.left {
		dfs(node: left)
	}

	// printing here is in-order

	if let right = node.right {
		dfs(node: right)
	}

	// printing here is post order


}