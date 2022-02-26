/** 
# Dictionary

This one just went over the difference between a dictionary and set.

A `dictionary` has keys and values

A `set` only has keys

Diction & Sets can both be:
	- Dynamic or static
	- Insertion
	- Deletion

Go for a Set if:

	- Order is not important
	- Unique elements is a requirement
	- Performance is important
*/


// MARK: - Dictionary insert
var dict = [String: String]()
dict["Cat"] = "Fluffy"
print(dict["Cat"] ?? "")

// MARK: - Set insert
var aSet = Set<String>()
aSet.insert("Pet it!")
for a in aSet {
	print(a)
}

// MARK: - Dictionary deletion
dict["Cat"] = nil
print(dict["Cat"] ?? "It left :(")

// MARK: - Set deletion
aSet.remove("Pet it!")
if aSet.isEmpty { print("No more pets") }

// MARK: - Set ignores double insertion
aSet.insert("A cat arrived!")
aSet.insert("A cat arrived!")

for a in aSet {
	print("But we only save that statement once:", a)
}