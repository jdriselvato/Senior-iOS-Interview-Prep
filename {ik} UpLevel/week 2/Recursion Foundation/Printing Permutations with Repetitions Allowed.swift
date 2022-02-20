#!/usr/bin/env swift
import Foundation

func calculateTime(_ name: String?, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print(name ?? "", "Time: \(timeInterval) seconds")
}

// # Printing Permutations with Repetitions Allowed

/* Example:

	print all decimal strings (0-9) of length n.

10 Digits _ _ _ _ _ _ _ _ _ _


This means we have 10^n

*/

class OptionOne {
	func decimalStrings(_ n: Int, _ slate: String) { // O(10^n)
		if n == 0 { print(slate); return }

		decimalStrings(n-1, slate+"0")
		decimalStrings(n-1, slate+"1")
		decimalStrings(n-1, slate+"2")
		decimalStrings(n-1, slate+"3")
		decimalStrings(n-1, slate+"4")
		decimalStrings(n-1, slate+"5")
		decimalStrings(n-1, slate+"6")
		decimalStrings(n-1, slate+"7")
		decimalStrings(n-1, slate+"8")
		decimalStrings(n-1, slate+"9")
	}
}

OptionOne().decimalStrings(2, "")


class OptionTwo {
	func decimalStrings(_ n: Int, _ slate: String) { // still O(10^n)
		if n == 0 { print(slate); return }

		for num in 0 ... 9 {
			decimalStrings(n-1, slate+"\(num)")
		}
	}
}

OptionTwo().decimalStrings(2, "")

// some how OptionOne was faster than OptionTwo according to `calculateTime`
// 		OptionOne Time: 0.000422392 seconds
// 		OptionTwo Time: 0.000731723 seconds
