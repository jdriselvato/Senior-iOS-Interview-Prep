// Implementing Dictionaries using Arrays and Linked Lists

// # Time complexity 

// For an unsorted Linked List:
// 	- Search(key) = O(n)
// 	- Insert(key) = O(1)
// 	- Delete(key) = O(n) // cause of search but delete take O(1)

// For a sorted Linked List:
// 	- Search(key) = O(n) // Binary search isn't possible on Linked List
// 	- Insert(key) = O(1)
// 	- Delete(key) = O(n) cause of search but delete take O(1)

// Compared to a sorted array, linked list seems useless. I'll be interested to see why we'd ever use a linked list.