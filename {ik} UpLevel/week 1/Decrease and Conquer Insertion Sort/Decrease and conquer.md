// Decrease and conquer

# Design strategy

1. Nibble away one element
	n -> n - 1

			or

2. Work at the end to extend the (n-1)st solution
	n - 1 -> n

## Steps

[_, _, _]
^
|-- this is the smallest element. So at [0] we know to just insert the smallest there.

Someone else will sort the remaining two elements prefix(0)

Someone else worries about prefix(1) until someone gets to index.last

The last developer does nothing

## "Lazy manager strategy"

A recursive strategy

from left to right, find smallest 

```

func insertion(_ array: inout [Int], index: Int, value: Int) {

	// base case
	if value > array[index] {
		array.insert(value, at: indxe)
	}

	var temp = array.popLast()
	for i in (0 ... array.count-1).reversed {
		
	}


}


```