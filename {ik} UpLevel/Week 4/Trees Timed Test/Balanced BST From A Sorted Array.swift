// Balanced BST From A Sorted Array

// Given a sorted list of distinct integers, build a balanced binary search tree (BST).

// A BST is called balanced if the number of nodes in the left and right subtrees of every node differs by at most one.

// Example

// {
// "a": [8, 10, 12, 15, 16, 20, 25]
// }

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
func build_balanced_bst(a: [Int]) -> BinaryTreeNode? {
    guard !a.isEmpty else { return nil }
    if a.count == 1 { return BinaryTreeNode(value: a[0]) }

    func helper(arr: [Int], start: Int, end: Int) -> BinaryTreeNode? {
        if start > end { return nil }
        
        let mid = Int((start+end)/2)
        
        var root: BinaryTreeNode = BinaryTreeNode(value: arr[mid])
        root.left = helper(arr: arr, start: start, end: mid-1) 
        root.right = helper(arr: arr, start: mid+1, end: end) 
        
        return root
    }
    
    return helper(arr: a, start: 0, end: a.count-1) 
}
