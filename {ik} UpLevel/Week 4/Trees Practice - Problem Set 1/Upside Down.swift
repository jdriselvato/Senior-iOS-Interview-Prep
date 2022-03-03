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

func flip_upside_down(root: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let root = root else { return nil }
    if root.left == nil && root.right == nil { return root }
    
    var upsideDown: BinaryTreeNode?
    
    func helper(node: BinaryTreeNode?, prev: BinaryTreeNode?) {
        guard let node = node else { return }
        
        if node.left != nil {
            helper(node: node.left, prev: node)
        }

        if node.left == nil && node.right == nil {
            upsideDown = node
        }

        node.left = prev?.right
        node.right = prev

    }
    helper(node: root, prev: nil)
    
    return upsideDown
}

