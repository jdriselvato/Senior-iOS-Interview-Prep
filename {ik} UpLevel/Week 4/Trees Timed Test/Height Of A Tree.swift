// Height Of A Tree

// Given a tree, find its height: number of edges in the longest path from the root to any node.


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
func find_height(root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var queue = [(tree: TreeNode, level: Int)]()
    queue.append((tree: root, level: 0))
    
    var height = 0
    
    while queue != nil {
        
        guard let treeLevel = queue.first else { break }
        
        for child in treeLevel.tree.children {
            queue.append((tree: child, level: treeLevel.level+1))
        }
        height = max(height, treeLevel.level)
        queue.removeFirst()

    }

    return height
}

// trick here is it's children TreeNodes and not BinaryTreeNodes