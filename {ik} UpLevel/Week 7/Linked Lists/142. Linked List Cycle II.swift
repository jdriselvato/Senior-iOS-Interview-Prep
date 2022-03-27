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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return nil }
        
        var fast = head
        var slow = head
        
        while fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
            
            if slow === fast {
                break
            }
        }
        
        slow = head
        
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        
        return fast
    }
}