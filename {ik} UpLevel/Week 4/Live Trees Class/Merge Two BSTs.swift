// Merge Two BSTs

// Given two Binary Search Trees (BSTs), merge them into a single height-balanced BST.

// Notes

// A node with value equal to the value of the root node can be inserted either in the left or right subtree.
// A binary tree is called height-balanced if for each node the following property is satisfied:
// The difference in the heights of its left and right subtrees differ by at most 1.
// Constraints:

// 1 <= number of nodes in the given BSTs <= 104
// -109 <= node value <= 109


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

func merge_two_binary_search_trees(root1: BinaryTreeNode?, root2: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let root1 = root1, let root2 = root2 else { return nil }
    
    func bt2Arr(root: BinaryTreeNode?, _ array: inout [Int]) {
        guard let root = root else { return }
        
        array.append(root.value)
        
        if let left = root.left {
            bt2Arr(root: left, &array)
        }
        
        if let right = root.right {
            bt2Arr(root: right, &array)
        }
        
    }
    var array1 = [Int]()
    bt2Arr(root: root1, &array1)
    
    var array2 = [Int]()
    bt2Arr(root: root2, &array2)
    
    let array = (array1 + array2).sorted()
    
    func bstMe(_ array: [Int], start: Int, end: Int) -> BinaryTreeNode? {
        if start > end { return nil }
        
        let middleIndex = Int((start+end)/2)
        let root = BinaryTreeNode(value: array[middleIndex])
        print(start, end, middleIndex)
        
        root.left = bstMe(array, start: start, end: middleIndex-1)
        root.right = bstMe(array, start: middleIndex+1, end: end)
        
        return root
    }
    
    return bstMe(array, start: 0, end: array.count-1)
}
