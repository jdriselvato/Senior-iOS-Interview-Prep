// Zigzag Level Order Traversal Of A Binary Tree

// Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

// Example:
// ```
// Input: root = [3,9,20,null,null,15,7]
// Output: [[3],[20,9],[15,7]]
// ```

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


func zigzag_level_order_traversal(root: BinaryTreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var result = [[Int]]()
    var queue = [BinaryTreeNode]()
    queue.append(root)
    var startIndex = 0
    var level = 1
    
    while queue.count > startIndex {
        var nodesInLevel = queue.count - startIndex
        var slate = [Int]()
        while nodesInLevel > 0 {
            if queue.count > startIndex {
                let node = queue[startIndex]
                startIndex += 1
                nodesInLevel -= 1
                slate.append(node.value)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        level += 1
        result.append(level % 2 == 0 ? slate : slate.reversed())
    }
    return result
}
