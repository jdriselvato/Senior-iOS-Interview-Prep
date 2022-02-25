// RGB ordering

// one pass without counting

var arr = ["R","G","B","R"]

func helper(arr: inout [String]) {
	var index = 0
	var red = -1
	var green = -1

	while index < arr.count { // k > 0 && 

		if arr[index] == "G" {
			green += 1 // because swap with blue
			arr.swapAt(index, green)
		}

		if arr[index] == "R" {
			green += 1 // because swap with blue
			arr.swapAt(index, green)
			red += 1
			arr.swapAt(green, red)
		}

		index += 1
	}

}

helper(arr: &arr) 