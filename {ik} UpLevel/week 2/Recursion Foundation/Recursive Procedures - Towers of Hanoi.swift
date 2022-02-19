#!/usr/bin/env swift
import Foundation

// Recursive Procedures: Towers of Hanoi

// Procedure - a function that does not return a result
//
//		Sorting is an example of a procedure because we are doing something to the array not returning the array. `inout`

/*

Three pegs move all discs to b. a small disc can not be under a larger disc. Swap to move A -> B in same stacking order

Start:
	|			|			|
   ---			|			|
	|			|			|
  -----			|			|
	|			|			|
---------		|			|	
							
	A 			B 			C

Finish:

	|			|			|
	|		   ---			|
	|			|			|
	|		  -----			|
	|			|			|
	|		---------		|	
							
	A 			B 			C


*/

// This can be solved via a decrease and conquer
//
//		- Since at the top level (me) all I want to do is move the largest in A to B. Meaning the underlings will worry about moving the smaller ones on top.
//		- Also note, in order for largest to move form A to B, all of the other disc must be in order at C and B will be empty.


// Video's psuedo code

func towerOfHanoi(n: Int, src: String, dest: String, aux: String) {
	if n == 1 {
		print("\tMove disc from", src, "to", dest)
		return
	}

	towerOfHanoi(n: n-1, src: src, dest: aux, aux: dest)
	print("\tMove disc from", src, "to", dest)
	towerOfHanoi(n: n-1, src: aux, dest: dest, aux: src)
}

print("Instructions with 3 discs:")
towerOfHanoi(n: 3, src: "A", dest: "B", aux: "C")

print("Instructions with 100 discs:")
towerOfHanoi(n: 100, src: "A", dest: "B", aux: "C")