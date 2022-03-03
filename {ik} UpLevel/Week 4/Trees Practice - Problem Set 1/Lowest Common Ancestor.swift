// Lowest Common Ancestor

// Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

// The LCA of nodes a and b in a tree is defined as the shared ancestor node of a and b that is located farthest from the root of the tree.

// Notes

// A node is considered its own ancestor and its own descendant.
// Return the value of the LCA node of the two given nodes.
// Constraints:

// 1 <= number of nodes <= 100000
// 1 <= node value <= number of nodes
// Node values are unique

// Rules:
// if a and b node share a parent the lca is parent
// if a/b node is a child to a parent & a/b is it's parent, the lca is parent
// if a and b don't share a parent, traverse up until a common parent

// Psuedocode:

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
func lca(root: BinaryTreeNode?, a: BinaryTreeNode?, b: BinaryTreeNode?) -> Int {
    guard let treeNode = root, let a = a, let b = b else { return 0 }
    return leastCommonAncester(treeNode: treeNode, a: a, b: b) ?? 0
}

func leastCommonAncester(treeNode: BinaryTreeNode, a: BinaryTreeNode, b: BinaryTreeNode) -> Int? {
    if treeNode.value == a.value || treeNode.value == b.value {
        return treeNode.value
    }
    
    var left: Int?
    var right: Int?
    
    if let leftNode = treeNode.left {
        left = leastCommonAncester(treeNode: leftNode, a: a, b: b)
    }
    
    if let rightNode = treeNode.right {
        right = leastCommonAncester(treeNode: rightNode, a: a, b: b)
    }
    
    if left != nil && right != nil {
        return treeNode.value
    }
    
    return left ?? right
}
