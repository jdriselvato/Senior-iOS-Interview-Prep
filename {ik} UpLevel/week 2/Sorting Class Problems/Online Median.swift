// Online Median

/*Given a list of numbers, the task is to insert these numbers into a stream and find the median of the 
	stream after each insertion. If the median is a non-integer, consider it’s floor value.

The median of a sorted array is defined as the middle element when the number of elements is odd and the mean of the middle two elements when the number of elements is even.

Example:

{
"stream": [3, 8, 5, 2]
}

Output: [3, 5, 5, 4]

Iteration	Stream		Sorted Stream		Median
1			[3]				[3]				3
2			[3, 8]			[3, 8]			(3 + 8) / 2 => 5
3			[3, 8, 5]		[3, 5, 8]		5
4			[3, 8, 5, 2]	[2, 3, 5, 8]	(3 + 5) / 2 => 4
*/


func online_median(stream: [Int]) -> [Int] {
	if stream.isEmpty { return [] }

	var median = [Int]()
	var temp = [Int]()
	for i in 1 ... stream.count {

		temp.append(stream[i-1])
		temp = temp.sorted() // O(n*log*n)

		if i % 2 != 0 { // odd arr count
			median.append(temp[Int(temp.count/2)])
		} else { // even arr count
			let oddMed = (temp[Int(temp.count/2)] + temp[Int(temp.count/2)-1])/2
			median.append(oddMed)
		}
	}

    return median
}


let meds = online_median(stream: [3, 8, 5, 2, 6])
print(meds)
