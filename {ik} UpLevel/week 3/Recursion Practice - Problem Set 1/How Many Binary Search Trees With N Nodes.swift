// How Many Binary Search Trees With N Nodes

// Write a function that returns the number of distinct binary search trees that can be constructed with n nodes. For the purpose of this exercise, do solve the problem using recursion first even if you see some non-recursive approaches.

// Example One

// {
// "n": 1
// }
// Output:

// 1
// Example Two

// {
// "n": 2
// }
// Output:

// 2
// Suppose the values are 1 and 2, then the two trees that are possible are

//    (2)            (1)
//   /       and       \
// (1)                  (2)
// Example Three

// {
// "n": 3
// }
// Output:

// 5
// Suppose the values are 1, 2, 3 then the possible trees are

//        (3)
//       /
//     (2)
//    /
// (1) [3,2,1]	
	
//    (3)
//   /
// (1)
//    \
//    (2) [3,1,2]

// (1)
//    \
//     (2)
//       \
//        (3) [1,2,3]

// (1)
//    \
//     (3)
//    /
// (2) [1,3,2]

//    (2)
//   /   \
// (1)    (3) [2,1,3]
// Notes

// Constraints:

// 1 <= n <= 16


// we'll cycle through each number of n which will 0 ... n changing the parent n-1
// well do th same for each child node until reaching a leaf node and adding it to count.

// Binary search tree rules:
// - left is smaller than parent
// - right is larger than parent
// - children must also be BST

// # What time the time complexity

// O(n^2) according to Google.


// hang up. I have no clue how to sort an array as a BST with creating a BST and I don't want to create a BST object.

// So lets break it down one step at a time. I don't know how to create a simple BST. So instead of doing this problem. Let's create a BST of a single root.

func makeBST(n: Int) {
	print("here")
	var bstArr = [Int]()
	for i in 0...n-1 {
		print(i)
		// create tree with initial parent
		if bstArr.isEmpty {
			bstArr.append(i)
			continue
		}
		
		// this is how you get the left or right but we wouldn't have a l/r yet
		// let left = 2 * i // left node
		// let right = 2 * i + 1 // right node


	    // if i is less than arr[i-1] mean it's on the left
		if i < bstArr[i-1] {
			bstArr.append(i)
		}
		// if i is greater than arr[i-1] it's on the right
		if i > bstArr[i-1] {
			bstArr.append(i)
		}
	}

	print("Answer:", bstArr)
}

// makeBST(n: 4)