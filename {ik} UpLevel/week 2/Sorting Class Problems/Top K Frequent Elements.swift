// Top K Frequent Elements

// Given an integer array and a number k, find the k most frequent elements in the array.

/*

Example: 

{
"arr": [1, 2, 3, 2, 4, 3, 1],
"k": 2
}

Outputs:

[3, 1]

*/


func find_top_k_frequent_elements(arr: [Int], k: Int) -> [Int] {
    if arr.isEmpty { return [] }

    guard let max = arr.max() else { return [] }

	// var max: Int = arr[0]

	// for i in 0 ... arr.count - 1 {
	// 	if arr[i] > max {
	// 		max = arr[i]
	// 	}
	// }

	var bucket = [[Int]](repeating: [], count: max+1) // +1 because we support 0

	for num in arr {
		bucket[num].append(num) 
	}

	bucket = bucket.filter({ !$0.isEmpty }).sorted(by: { $0.count > $1.count })


	var freq: [Int] = []

	for i in 0 ... k - 1 {
		freq.append(bucket[i][0])
	}

    return freq
}



let numbers = [1, 2, 1, 2, 3, 1]
let k = 2
let topK = find_top_k_frequent_elements(arr: numbers, k: k)

print(topK)


/// This works but is there a way to do the sorted & freq.append in less time? Possible O(n) for the largest number count in a bucket



