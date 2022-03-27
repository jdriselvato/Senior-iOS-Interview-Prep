# Live Scalable Systems Class with Niloy

<details>
	<summary>Read more</summary>

## Introduction

- Took IK in 2016
- These are the kind of SD questions to get into LinkedIn

### 3 catories

- online microservice
- compute intensive graph processor
- stream processing

</details>

# High Level Thought Process

<details>
	<summary>Read more</summary>

The first few steps to go through for every design problem:

4 parts:

# Step 1: Wear the Product Management Hat

- treat interviewer as an end-user / customer
- collect functional requirements
	- this is the detailed problem-statement
	- high level
	- ask question to clarify all doubts
	- object would be to be able to visualize 2-3 APIs from the requirements
- collect design constraints
	- numbers, how many, how much
	- required for answer scalability
	- often interviews trow these back to the candidate
		- so it is beneficial to research them

# Step 2: Id building blocks (MS)

- tream the interviewer as a peer
- imagine yourself as a engineering leader irl
- bucketize functional requirements into MS
	- simple high level clustering of requirements

### Fundamental building blocks:

- K_V workloads: (online)
	- Simple CRUD data storage and access
	- constant order time complexities
	- data can be CRUD or timeseries
	- Domain specific Business logic in APIS
	- Examples:
		- shopping cart purchase
		- airline purchase
- Computer intensive workloads: (mostly read only)
	- a single API in bulky and heavily algo
	- high time complexity
	- in memory processing
	- domain specific algo
	- Examples:
		- 90% of Leetcode
		- Algo based
		- batch processing and offline
- Streaming Analytics: (near real time)
	- perpetual data ingeston of time
	- sliding window based processing
	- Analytics complexity not as bad as Computer intensive
	- Examples:
		- Nest
		- AI car driving
		- application montoring

the four basic operations (create, read, update, and delete) of data storage, regarded collectively.


### Bonus:

- Message queues: (arterial)
	- Data brokers: (arterial)
- Collectors, extractors and transformers
	- data transport

# Step 3: Propose umbrealla architecture

- propose logical architecture
	- block diagram of each microserver
	- api gateway to interface between user and system
- propose and explain data.logic flow between them, rule of thumb:
	- if high volume of data needs to be pushed in near time between two MS use Pub-sub

# Step 4: Delegate design of building blocks

- treat this step to development team
- deep dive on each building block at a time
- type ot map each building block as one of the tech types
- interate over and discuss each
- rinse and repeat
- if too many MS or building blocks
	- negotiate with the interview on which one to focus on
	- you only have constant time
	- depending on the number of MS only do 1 or 2

Tip: pick K-V owrkloads

# Step 5: Discuss business Impact (Optional)

- Map functional requirements per MS to the business impact they will have
- A new requirement and gives major bonus points

</details>

# Designing compute intensive building block

<details>
	<summary>Read more</summary>

# Step 1:

## Problem: 

> Design a grpah processer that determines the degree of connection between two memebers in a social graph

- APIs:
	- is FirstDegree(n1, n2) -> returns true if n1 and n2 re connected
	- isSecondDegree(n1, n2) -> returns true if n1 is connected to some x and  is connected to n2
	- isThreeDegree(n1, n2) -> return trues if n1 is ocnnected to some x, x is connected to some y and y is connected to n2

- Graph:
	- in-memory KV store
		- K is userID
		- V is sorted array of 1st gree connections
- undirected grpah
- getAdjList(K) -> reference to the sorted array

# Step 2:


</details>