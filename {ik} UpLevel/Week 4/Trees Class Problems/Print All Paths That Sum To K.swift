// Print All Paths That Sum To K

// Given a binary tree and an integer k, find all the root to leaf paths that sum to k.


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
func all_paths_sum_k(root: BinaryTreeNode?, k: Int) -> [[Int]] {
    guard let root = root else { return [[-1]] }

    var path = [[Int]]()
    var temp = [Int]()

    func helper(root: BinaryTreeNode?, k: Int, slate: inout [Int]) {
    	guard let root = root else { return }

    	if root.value == k && root.left == nil && root.right == nil {
    	    slate.append(root.value)
    		path.append(slate)
    		slate.removeLast()
    		return
    	}

    	slate.append(root.value)
    	if let left = root.left {
    		helper(root: left, k: k-root.value, slate: &slate)
    	}

    	if let right = root.right {
    		helper(root: right, k: k-root.value, slate: &slate)
    	}
    	slate.removeLast()
    }

    helper(root: root, k: k, slate: &temp)

    return path.isEmpty ? [[-1]] : path
}

/*

The catch here is appending and removing slate when the root.value == k

Also the instructions stated return [[-1]] if null which I didn't read the first time.

*/
