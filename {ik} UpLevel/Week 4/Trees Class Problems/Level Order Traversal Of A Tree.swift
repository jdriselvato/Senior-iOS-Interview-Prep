// Level Order Traversal Of A Tree

// Given a tree, list node values level by level from left to right.

// NOTE: In this one any sub tree can have up to 19999 nodes. So it's not left or right, it's children [TreeNode], not a binary tree

// Example 1:
//
// Output:
// [
// [1],
// [3, 4, 2],
// [5, 6]
// ]

/*
For your reference:
final class TreeNode {
    var value: Int
    var children: [TreeNode]

    public init(value: Int) {
        self.value = value
        self.children = []
    }
}
*/



func level_order(root: TreeNode?) -> [[Int]] {
    // BFS problem
    guard let root = root else { return [] }
    
    var result = [[Int]]()
    
    var queue = [TreeNode]()
    queue.append(root)
    
    while !queue.isEmpty {
        
        var temp = [Int]()
        var count = queue.count
        
        while count > 0  {
            guard let node = queue.first else { break }

            temp.append(node.value)
            count -= 1
            
            for child in node.children {
                queue.append(child)
            }
            
            queue.removeFirst()
        }
        result.append(temp)
    }
    
    return result
}
