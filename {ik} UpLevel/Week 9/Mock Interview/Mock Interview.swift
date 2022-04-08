// Mock Interview of John Riselvato with  Brian Kim, April 6, 2022

/**

Most frequent subtree sum

Given the root of a binary tree, return the most frequent subtree sum. If there is a tie, return all the values with the highest frequency in any order.

The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself).

  5
 / \
2  -3

[4, 2, -3]



   5
  / \
 2  -5
 | \
 1 3

1, 3, -5, 6, 6
 
[6]
*/

let dict: [Int: Int]

func mfss(node: TreeNode) returns array of mostfreq [Int]
   
   sum(node)
   
   var array = [Int]()
   var cmax = 0
   for (ckey,val) in dictionary.enumerated {
       
       if val = cmax {
           array.append(ckey)
       if val > cmax {
           cmax = max(val, cmax)
           array.removeAll()
           array.append(ckey)
   }
   
   return array

   
   
   
func sum (currentNode) returning val
    if currentNode.isEmpty { return 0 }
    
    if currentNode.left is empty and currentNode.right is empty - base case
        dict[current.val] = (dict[currentNode.val] ?? 0) + 1
        return currentNode.val
  
    
    let left = sum(currentNode.left)
    let right = sum(currentNode.right)
    let subtree_sum = left + right + currentNode.val
    
    dict[subtree_sum] = (dict[subtree_sum] ?? 0) + 1

    return subtree_sum
