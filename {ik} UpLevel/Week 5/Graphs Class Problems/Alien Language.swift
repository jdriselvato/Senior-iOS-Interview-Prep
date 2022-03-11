// Alien Language

func findOrder(_ lang: [String]) -> String {
	// make a graph
	var letters = Set<Character>()

	var adjList = [[Character]]()
	for c in lang {
		adjList.append(Array(c))
		for i in Array(c) {
			letters.insert(i)
		}
	}

	print(letters)

	var order = [Character]()

	for i in 0..<adjList.count {
		for j in 0..<adjList[i].count {
			if i+1 < adjList.count {
				let a = adjList[i]
				let b = adjList[i+1]
				if j < a.count && j < b.count {
					if a[j] != b[j] {
						if !order.contains(a[j]) {
							order.append(a[j])
						}
						if !order.contains(b[j]) {
							order.append(b[j])
						}
					}
				}
			}
		}
	}

	return String(order)
}

let order = findOrder(["baa", "abcd", "abca", "cab", "cad", "caaf"])
print("Order:", order, order == "bdac")

// b -> a, d 
// d -> a
// a -> c
// c -> nil

/*
var adjList = [Character: [Character]]()
for i in 0..<lang.count {
	let chars: [Character] = Array(lang[i])
	for j in 0..<chars.count {

		let source = chars[0]
		if adjList[source] == nil {
			adjList[source] = []
		}
		adjList[source]?.append(chars[j])
	}
}
print(adjList)
*/

//// Class notes on how to solve this:

# This is a topocal sort question

- used when asked if something comes before another item 

```
	b->a->c
	|  ^
	| /
	v/
	d
```


