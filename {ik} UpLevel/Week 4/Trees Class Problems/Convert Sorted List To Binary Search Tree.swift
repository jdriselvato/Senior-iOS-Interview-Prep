// Convert Sorted List To Binary Search Tree

// Given a linked list with elements sorted in ascending order, convert it into a height-balanced binary search tree.

// For your reference:
final class LinkedListNode {
    var value: Int
    var next: LinkedListNode?

    public init(value: Int) {
        self.value = value
    }
}

final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}

func sorted_list_to_bst(head: LinkedListNode?) -> BinaryTreeNode? {
    guard var head = head else { return nil }

    // create an array from the LinkedList
    var listNode = head
    var array = [Int]()

    // With helper
    // func helper(_ node: LinkedListNode?) {
    // 	guard let node = node else { return }

    // 	array.append(node.value)
    // 	if node.next != nil {
    // 		helper(_: node.next)
    // 	}
    // }
    // helper(head)

    // Without helper
    array.append(head.value)
    while let next = head.next {
    	array.append(next.value)
    	head = next
    }

    print(array.count, array)

    if array.count == 1 {
    	return BinaryTreeNode(value: array[0])
    }

    func bstMe(_ array: [Int], start: Int, end: Int) -> BinaryTreeNode? {
    	if start > end { return nil }

    	// get middle index to start BST
    	let middleIndex = Int((start+end)/2)
    	let root = BinaryTreeNode(value: array[middleIndex])
    	print(start, end, middleIndex)

    	root.left = bstMe(array, start: start, end: middleIndex-1)
    	root.right = bstMe(array, start: middleIndex+1, end: end)

    	return root
    }

    let root = bstMe(array, start: 0, end: array.count-1)

    return root
}

var listHead = LinkedListNode(value: -1)
listHead.next = LinkedListNode(value: 2)
listHead.next?.next = LinkedListNode(value: 3)
listHead.next?.next?.next = LinkedListNode(value: 5)
listHead.next?.next?.next?.next = LinkedListNode(value: 6)
listHead.next?.next?.next?.next?.next = LinkedListNode(value: 7)
listHead.next?.next?.next?.next?.next?.next = LinkedListNode(value: 10)

let _ = sorted_list_to_bst(head: listHead)
