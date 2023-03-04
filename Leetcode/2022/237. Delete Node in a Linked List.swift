/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let nextNode = node?.next else { return }
            
        node?.val = nextNode.val
        node?.next = nextNode.next
    }
}





/*
How it works: Because ListNode is a class object, the original head already points to the node's address and any changes that happen to the delete node automatically are referenced by the original head.

Read more about reference types: https://developer.apple.com/swift/blog/?id=10
*/

// I made a playground simplified version 



class Num {
    var val: Int?
    var num: Num?
}

func delete(num: Num) {
    guard let nn = num.num else { return }
    num.num = nn.num
    num.val = nn.val
}

func printNums(num: Num) -> [Int] {
    var node: Num? = num
    var arr = [Int]()
    while node != nil {
        arr.append(node?.val ?? 0)
        node = node?.num
    }
    return arr
}

let a = Num()
a.val = 10
let b = Num()
b.val = 20
a.num = b
let c = Num()
c.val = 30
b.num = c

print(printNums(num: a))
delete(num: b)
print(printNums(num: a))
