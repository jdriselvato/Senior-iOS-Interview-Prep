// PostOrder Traversal Without Recursion

// Given a binary tree, find its post-order traversal without using recursion.

// Notes

// Constraints:

// 1 <= number of nodes <= 105
// -109 <= value in a node <= 109

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

func postorder_traversal(root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }
    if root.right == nil && root.left == nil {
        return [root.value]
    }
    
    var queue: [BinaryTreeNode] = [root]
    var result = [Int]()
    
    // cycle through in inorder
    while let node = queue.popLast() { // since we append right last popping last is like reverse inorder (right to left)
        if let left = node.left {
            queue.append(left)
        }
        
        if let right = node.right {
            queue.append(right)
        }
        result.append(node.value)
    }
    
    return result.reversed() // postorder
}

let head = BinaryTreeNode(value: 1)
head.left = BinaryTreeNode(value: 2)
head.left?.left = BinaryTreeNode(value: 4)
head.left?.right = BinaryTreeNode(value: 5)
head.right = BinaryTreeNode(value: 3)

let postOrder = postorder_traversal(root: head)
print(postOrder)