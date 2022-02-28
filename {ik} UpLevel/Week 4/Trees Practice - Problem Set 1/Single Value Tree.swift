// Single Value Tree

// Given a binary tree, find the number of unival subtrees. An unival (single value) tree is a tree that has the same value in every node.

/*
For your reference:
final class TreeNode {
    var value: Intx
    var children: [TreeNode]

    public init(value: Int) {
        self.value = value
        self.children = []
    }
}
*/

// In this one any sub tree can have up to 19999 nodes. So it's not left or right, it's children [TreeNode], not a binary tree


func level_order(root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var result = [[Int]]()
    var queue = [TreeNode]()
    queue.append(root)
    var startIndex = 0
    
    while queue.count > startIndex {
        var numNodes = queue.count - startIndex
        var slate = [Int]()
        
        while numNodes > 0 {
            if startIndex < queue.count {
                let node = queue[startIndex]
                startIndex += 1
                numNodes -= 1
                slate.append(node.value)
                for child in node.children {
                    queue.append(child)
                }
            }
        }
        result.append(slate)
    }
    return result
}