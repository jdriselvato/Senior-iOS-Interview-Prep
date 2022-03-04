// Kth Smallest Element Of BST

// Given a binary search tree (BST) and an integer k, find k-th smallest element.

// Example

//	   2
//  /     \
// 1		3

// Example one

// k = 3

// Output:

// 3
// The 3rd smallest element is 3.


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
func kth_smallest_element(root: BinaryTreeNode?, k: Int) -> Int {
    guard let root = root else { return 0 }
    if root.left == nil && root.right == nil {
        return root.value
    }
    
    var array: [Int] = []
    func helper(_ root: BinaryTreeNode?) {
        guard let root = root else { return }
        
        array.append(root.value)
        
        if let left = root.left {
            helper(left)
        }
        
        if let right = root.right {
            helper(right)
        }
    }
    
    helper(root)
    
    array = array.sorted()

    return array[k-1]
}

// an improvement on this would to use the fact that it is a BST and using inorder to get it sorted already.

// inorder is always sorted on a BST

func kth_smallest_element(root: BinaryTreeNode?, k: Int) -> Int {
    guard let root = root else { return 0 }
    if root.left == nil && root.right == nil {
        return root.value
    }
    
    var array: [Int] = []
    func helper(_ root: BinaryTreeNode?) {
        guard let root = root else { return }
        
        if let left = root.left {
            helper(left)
        }

        array.append(root.value) // in-order!
        
        if let right = root.right {
            helper(right)
        }
    }
    
    helper(root)
    
    return array[k-1]
}