// Recursion as a Lazy Manager's Strategy

// Video Notes and Example

/* My understanding of it

So this talks about how to use recursion with sorting type of problems.

It'll always be 

func
	if something can be done
		do it
	else 
		recall

Example

func countdown(num: inout Int) {
	if num == 0 { return }

	num -= 1
}

*/

// Ticket Counter example:

// take an array of people in line and cound how many people are in it with recursion

func numberOfPeopleInLine(_ array: [Int]) -> Int {
	var count = 0
	helper(array, count: &count)
	return count
}

func helper(_ array: [Int], count: inout Int) {
	if let last = array.last, last == array[count] { 
		count += 1 // themselves
		return 
	}
	count += 1
	helper(array, count: &count)
}

let people = [1,2,3,4,5,6,7,8,9,10]
let total = numberOfPeopleInLine(people)

print(total, total == people.count)