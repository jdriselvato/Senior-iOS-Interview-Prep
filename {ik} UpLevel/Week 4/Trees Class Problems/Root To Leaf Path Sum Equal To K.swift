// Root To Leaf Path Sum Equal To K

// Given a binary tree and an integer k, check whether the tree has a root to leaf path with a sum of values equal to k.

// Example:
//      Path 0 -> 1 -> 3 has the sum of node values equal to 4.




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
func path_sum(root: BinaryTreeNode?, k: Int) -> Bool {
    guard let root = root else { return false }
    // Write your code here.
    
    var hasSum = false
    // DFS
    func helper(root: BinaryTreeNode?, k: Int) {
        guard let root = root else { return }
        
        if root.value == k && root.left == nil && root.right == nil {
            hasSum = true
            return
        }
        
        if root.left == nil && root.right == nil { 
            return
        }
        
        if let left = root.left {
            helper(root: left, k: k-root.value)
        }
        
        if let right = root.right {
            helper(root: right, k: k-root.value)
        }
    }
    
    helper(root: root, k: k)
    
    return hasSum
}
