# iOS API's - Performantly Fetching, Handling, and Storing Data Live Class with Kevin

---

## What is concurrency

- a program with two or more tasks are defined independently
- execute independent of each other
- doesn't mean in parallel

## Why is it important

- imagine you are working on a project together, do you all wait around until one thing is done before moving on to the next?
	- no lol

Q. To perform concurrency in swift do we often use thread objects
A. false

Q. What is a deadlock?
A. A problem in concurrency that can cause standstills in a process. both processes are busy and the process fails

Q. What is a livelock?
A. When processes continually change state with respect to each other without progressing, but still using CPU. Keep asking until it gets an answer

Q. What is a race condition?
A. When the result of an operation are determined by the time tasks are finished

## Concurrency tools:

- dispatchQueue
- operations
- async/await

# Grand Central Dispatch

- api for managing concurrent operations provided by Apple
- why is it important?
	- most commonly used

### Main Thread

``` swift
func computer(a: String, b: String) -> String {
	return a+b
}

func getA(onComplete: @escape (string) -> Void) {
	Thread.sleep(forTimeInterval: 2)
	let data = " A complete"
	print(data)
	onComplete(data)
}

func getB(onComplete: @escape (string) -> Void) {
	Thread.sleep(forTimeInterval: 2)
	let data = " B complete"
	print(data)
	onComplete(data)
}

func getComputedData(onComplete: @escape (String) -> Void) {
	getA(complete: { a in 
		getB(complete: { b in 
				let result = compute(a: a, b: b)
				print(result)
				onComplete(result)
			})
		})
}

```

- not very readable cause of nesting
- on the main thread

### DispatchQueue

``` swift

// all ui events on main thread
DispatchQueue.main.async {
	task()
}

DispatchQueue.global(qos: .background).async {
	task()
}

func task() {
	print("task is done")
}

```

Q. What is the differenc ebetween a serial and concurrent queue?
`let serialQueue = DispatchQueue(label: "serialQueue")`
`let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)`

A. Serial queue executes one task at a time in the order in which they are added to the queue. Concurrent queue allow multiple tasks to run at the same time

Q. Sync vs async
A. sync will block the queue until task is complete, never called on main thread. above async dispatch queue is really good for running things in maintheead quickly.

### DispatchGroup

``` swift
let dispatchGroupTask = DispatchGroup()
dispatchGroupTask.enter()
dispatchGroupTask.leave()
dispatchGroupTask.notify(queue: .main) {
	print(finished)
}
```

Pros:

- executes faster
- less nesting

Cons:

- more error prone
- more boiler plate


# Operations Queue

Q. what is it? 
A. a way to regulate concurrency is iOS

``` swift
let customeQueue = Operationqueue() // on bg
let mainQueue = OperationQueue.main // on main

// run quickly.
mainQueue.addOperation {
	// goes in main thread
}

// or pass the oepration
let operation = Operation()
customeQueue.addOperation(operation)
```

Q. why pass in operation instead of creating one in the param? and why use operations over GCD?
A. to be able to add dependencies and keep code clean

``` swift
let fetchImageDependencyOperation = Operation()
let fetchImageOperation = Operation()
fetchImageOperation.addDependency(fetchImageDependencyOperation)
customeQueue.addOperation(fetchImageOperation)
```

- now we can add fetchImageOperation to the operation queue and the operation queue now know that fetchImageOperation is dependent on fetch fetchImageDependencyOperation completeing
- you can check the operation start `fetchOp.isReady`
- can cancel operation `fetchOp.cancel()`
- can limit max operations `queue.maxConcurrentOperationCount = 10`
- OperationQueue is heavier / GDC is more low level
	- built on top of GDC

Pros:

- easier to read better looking code

Cons:

- boiler plate
- not as performant
- error prone

in general when deciding between GDC and operations they both work so pick what works in a current situation.

# Async and Await?

Q. What is Async and Await?
A. Async process something and async wait until it's completed

- better readability

``` swift
func computeSomething(a: a, b: b) async -> String {
	return a+b
}

func getA() async -> String {
	Thread.sleep(forTimeInterval: 2)
	let data = "A"
	return data
}
func getB() async -> String {
	Thread.sleep(forTimeInterval: 2)
	let data = "B"
	return data
}

func getComputeData() async -> String {
	async let a = getA()
	async let b = getB()

	return await computeSomething(a: a, b: b)
}

// to tun the code outside func you have to put it in async block
Task { // or could use `async`
	let data = await getComputeData()
	/// then use dq to put it back in main thread
	DispatchQueue.main.async {
		print(data)
	}
}
```

Pro:

- looks like swift
- less boiler plate

Cons:

- new / evolving

# Interview Questions

- How would you fix this code?

```
func getData() {
	let data = downloadData()
	headerText = data
}
```

---

# Networking and communication

- handling the response (codable)
- network request
- deep linking (high level)

