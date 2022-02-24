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
// (1)

//    (3)
//   /
// (1)
//    \
//    (2)

// (1)
//    \
//     (2)
//       \
//        (3)

// (1)
//    \
//     (3)
//    /
// (2)

//    (2)
//   /   \
// (1)    (3)
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


// func how_many_bsts(n: Int) -> Int {
// 	let count = n
//     return count
// }

// func helper() {
// 	if n == 1 || n == 0 { return n }
//     // Write your code here.

//     var count = 0
//     for i in 1 ... n-1 {
//     	count = how_many_bsts(n: i)*how_many_bsts(n: n-i)

//     }
// }


// hang up. I have no clue how to sort an array as a BST with creating a BST and I don't want to create a BST object.

// So lets break it down one step at a time. I don't know how to create a simple BST. So instead of doing this problem. Let's create a BST of a single root.

func makeBST(n: Int) -> [Int] {

	var bstArr = [Int]()
	for i in 1 ... n {

		if bstArr.isEmpty {
			bstArr.append(i)
			return
		}

		if i < bstArr[i-1]

	}


}
