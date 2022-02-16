// Kth Largest In An Array

/* Given an array of integers, find the k-th largest number in it.

# Example One

{
"numbers": [5, 1, 10, 3, 2],
"k": 2
}
Output: 5

# Example Two

{
"numbers": [4, 1, 2, 2, 3],
"k": 4
}
Output: 2
*/

class Solution {
	func kth_largest_in_an_array(numbers: [Int], k: Int) -> Int {
		if numbers.isEmpty { return 0 }

	    let temp = numbers.sorted(by: { $0 > $1 }) // O(nlogn)
	    print(temp)
	    return temp[k-1]
	}
}

let kthLargest = Solution().kth_largest_in_an_array(numbers: [4, 1, 2, 2, 3], k: 4)
print(kthLargest)