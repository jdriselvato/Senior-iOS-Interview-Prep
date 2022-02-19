import Foundation

/// Helpers

func calculateTime(name: String?, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print(name ?? "", "Time: \(timeInterval) seconds")
}

// Compute n^k for any number recursively
// This is a decrease and conquer strategy 
// Time Complexity? O(k) because k is the factor here

func compute(n: Int, powerOf k: Int) -> Int {
	if k == 0 {
		return 1
	}

	return n * compute(n: n, powerOf: k-1)
}

print(compute(n: 1043, powerOf: 2))

// How many subsets of a set of size n are there?
// Example 1: set of size 1 would have 2 {a},{} 
//			n=1 has 2 subsets
//
// Example 2: set of size {a,b} would have?
//			{},{a},{b},{a,b} 
//			n=2 has 4 subsets
//
// Example 3: set of size {a,b,c} would have?
//			{},{a},{b},{c},{a,b},{a,c},{b,c},{a,b,c}
//			n=3 has 8 subsets

// Sets are 2^n

var subset1Index = 0
func subset(_ n: Int) -> Int { // O(n)
	subset1Index += 1

	if n == 0 { return 1 }
	return 2 * subset(n-1)
}

print("Subet 1:", subset(10))

// What out for small changes in a recursive function that leads to major increases in time complexity.
// For example, the subSet function, we could do subset(n-1) + subset(n-1) but it leads to a exponential time complexity

var subset2Index = 0
func subset2(_ n: Int) -> Int { // O(2^n)
	subset2Index += 1

	if n == 0 { return 1 }
	return subset2(n-1) + subset2(n-1)
}

print("Subset 2:", subset2(10))


// subset vs subset2
// subset = 11 calls
// subset2 = 2047 calls
print(subset1Index, "vs", subset2Index)

// How can we turn the subset algo from O(n) to O(logn)?
// My understanding: Divide n by 2 and multiple the answer by 2?

var subset3Index = 0
func subset3(_ n: Int) -> Int { // O(n)
	subset3Index += 1
	if n == 0 { return 1 }
	return 2 * subset(2*(n-1)/2)
}

calculateTime(name: "Subset 3") {
	print("Subset O(log n):", subset3(15))
}

print(subset1Index, "vs", subset2Index, "vs", subset3Index)

// -------


// Binary search can be implimented as T(n) = T(n/2) + 1