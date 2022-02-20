#!/usr/bin/env swift
import Foundation

// Printing Combinations

// Return all combinations but not repeating

class OptionOne {

	var perms: [String] = []
	func comboHelper(_ slate: String, chars: [String]) { // O(2^n)
		print("comboHelper", slate, chars)
		// base case
		// why? because if chars is empty, slate should be at it's final state
		if chars.isEmpty { perms.append(slate); return }

		let right = Array(chars[1..<chars.count])

		// exclude
		comboHelper(slate, chars: right)

		// include
		comboHelper(slate + chars[0], chars: right)
	}

}

let one = OptionOne()
one.comboHelper("", chars: ["a", "b", "c", "d", "e"])
print(one.perms, "\n", one.perms.count)