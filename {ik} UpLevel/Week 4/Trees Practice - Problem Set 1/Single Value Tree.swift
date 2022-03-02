// Single Value Tree

// Given a binary tree, find the number of unival subtrees. An unival (single value) tree is a tree that has the same value in every node.


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

final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}

// if a parent's value == it's left and right value then increase count
// if a parent's value has a left or right that is null 
    // but either of them has a value that is equal to parent increase count
// if node is a leaf and has same value as parent increase count
// if a parent's value does not equal it's left or right continue 
    // the traversal because it's node may be correct on the next level
// The number doesn't matter. It's the parent-left-right relation that matters





func find_single_value_trees(root: BinaryTreeNode?) -> Int {
    guard let root = root else { return 0 }
    var count = 0

    func helper(_ node: BinaryTreeNode) -> Bool {

        var resultVal = true
        let nodeVal = node.value

        if let left = node.left {
            resultVal =  helper(left) && left.value == nodeVal
        }

        if let right = node.right  {
            resultVal =  helper(right) && right.value == nodeVal && resultVal
        }

        if resultVal == true { count += 1 }
        print(node.value, resultVal, count)

        return resultVal
    }

    _ = helper(root)

    return count

}

// No clue why this (above) works but my version doesn't (below)



func find_single_value_trees(root: BinaryTreeNode?) -> Int {
    if root.count == 1 { return 1 }
    if root.isEmpty { return 0 }

    var count = 1 // parent is considered a valid single tree
    
    func helper(root: BinaryTreeNode?, parentValue: Int) {
        guard let root = root else { return }
        
        let left = root.left
        let right = root.right
        
        if left?.value == root.value && right?.value == root.value {
            count += 1
        } else if left?.value == root.value && right == nil {
            count += 1
        } else if right?.value == root.value && left == nil {
            count += 1
        } else if left == nil && right == nil { // leaf
            if root.value == parentValue {
                count += 1
            }
            return
        }
        
        helper(root: left, parentValue: root.value)
        helper(root: right, parentValue: root.value)
    }
    
    helper(root: root, parentValue: 0)
    
    return count
}
