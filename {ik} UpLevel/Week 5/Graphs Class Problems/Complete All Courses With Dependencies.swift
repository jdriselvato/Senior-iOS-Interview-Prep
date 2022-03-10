// Complete All Courses With Dependencies

// A university has n courses to offer. To graduate from that university, a student must complete all those courses. Some courses have prerequisite courses. One can take a course only after completing all of its prerequisites. Dependencies between the courses are described by two arrays a and b of the same size: course a[i] must be taken before course b[i] for all valid indices. Is it possible to complete all the courses without violating constraints?

// Example One

// {
// "n": 4,
// "a": [1, 1, 3],
// "b": [0, 2, 1]
// }
// Output:

// 1
// One possible ordering is 3, 1, 0, 2.

// Example Two

// {
// "n": 4,
// "a": [1, 1, 3, 0],
// "b": [0, 2, 1, 3]
// }
// Output:

// 0
// Every possible ordering of the courses violates at least one of the constraints.

// Notes

// The courses are labeled from 0 to n - 1.
// Constraints:

// 2 <= n <= 100000
// 1 <= size of a = size of b <= 100000
// 0 <= a[i], b[i] < n holds for any valid index i
// a[i] != b[i] holds for any valid index i
// No duplicate dependencies are present