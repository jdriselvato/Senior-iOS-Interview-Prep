# SS1 1 Online processing Systems and the Client-Server model

## System design:

System is made up of three atomic components:

- CPU
- MEMORY (RAM/Disk)
- Communication channels
	- system bus
	- stream of data (in/out)
	- internet connection


client ---request(with input)---> Server	 
	   <-response (with output)-- 

Ensure that request/response is able to handle large user bases is what makes a system scalable.

### Quiz:

> **Q:** In computer systems, we use _____ for client-server interaction enabling use to hide the complexities of the service offered?

**A:** APIs


> **Q:** Which of the following criteria does a system need to fulfill in order to be a scalable system?

**A:** Handle increased load of users & Have low response time irrespective of the number of users

---

# SS1 2 URL Shortener Functional Requirements

## Design a URL shortener service

Example: bit.ly / tinyurl.com / youtu.be

- popular question for SD

## Why use a url shortner?

- Analytics
- Shorter urls / easier to type for the user
- character limit on web services that limit text (Twitter/SMS)
- Give more meaning to a URL (if customizable)
- URL contains non-english characters
- Referral program analytics

## Building the URL shortner service

Function requirements:

1. given long url -> shorten it and return the short URL
2. If someone hits the short URL, translate it back to long URL
3. if the same long URL is entered multiple times, return a differnent and unique short URL each time

NOTE: if you are merely asked "Design a URL shortener," it's my job to unpack it into these + more requirements

Optional functional requirements

- URLs can be customized
- TTL for the map (Time to live)
- Analytics

Top-down steps for systems design in an interview:

1. Gather functional requirements
	- this is the detailed problem statements
	- in plain English, describe the user's view of the system
	- Show that you can communicate and unpack a short, open-ended problem
	- ask clarifying questions to get all doubts answered

## How would I build this?

- Buy a web domain
	- ideally one that is less than 4 characters + a 2 character top-level domain
	- top-level domain (.go, .ok .us .com, etc)
- Set up a server for hosting either through a 3rd party or buy a server
- Set up a basic mySQL DB to store these future short links to their corrisponding long URLS
	- The DB may contain short url, long url, date added, analytics
- We'd build a CMS or API system to interface between db and user.
	- could be node.js or drupal or django
- With the domain in hand, we'd build a simple website with an input field which takes the long url.
- The website's input form would valid the url and if invalid, show an error
	- if valid sends it to our API
- the cms would handle generating a short URL storing the long URL & it's short in the DB
- and upon success, return the short URL to the same web page for the user to copy or share.
- Now that our short url exists, we need to handle redirection to the original url when visited
	- Javascript allows for redirection on window load
	- so we'd retreive the long url from the DB, load the window and send the user off to the original url.
- if the a user comes back with the same URL and wants a new short URL, we'd store in in the DB like normal just as every url stored in the DB will increment by a primary index.

---

# SS1 3 Depth vs Breadth Analysis

These two API funcion requirements:

- given long url -> get unique, short url
- given short url -> get back long url

This is a monolith / microserver

- which makes it a depth-oriented problem

535. Encode and Decode TinyURL - medium question on Leetcode

## Steps:

1. Gather functional requirements
2. Cluster them into a collection of microservices
3. draw the architecture diagram connecting them
4. dive into each microserve (assuming scale isn't a focus)

# SS1 4 URL Shortener Naïve counter

Counter method incrimenting an index

Pros:

- easy to impliment

Con:

- Predictable

# SS1 5 URL Shortener Sophisticated Counter (28:28)

## How do we convert a number n into base x?

``` swift
let digits = "0123..9abcdef...zABC...Z-_" // 64 
func encode(n: Int, base: Int = 64) -> String {
	var digitList = [] // future index to string
	var current = n 
	while current >= x {
		var quotient = Int(current/x)
		var remainder = current % x
		digitList.append(digits[remainder])
		// map remainder to a digit in base x 
		// 	and append it to a growing list of digits
		current = quotient
	} // exit because current is less than x

	// map current to a digit in base x
	if current > 0 {
		digitList.append(digits[current])
	}

	//	reverse the list of digits & join them into a string
	digitList.reversed()
	var shortURL = "".join(digitList)
	hashmap[shortURL] = longURL

	return "http://bit.ly"+shortURL
}

func decode(shortURL: String) {
	// remove "http://bit.ly"
	return hashmap[backhalf]
}
```

Pros: 

- no collisions
- short url is truely short

Cons:
- Predictable

# SS1 6 URL Shortener Cryptographic hash functions

Can we make a short url to be unpredictable without overriding or collision?

- What should the length be?
	- 6 or 7 because 64^6 ot 64^7 is in billons

encode the string with a checksum like MD5, SHA-1, SHA-2, SHA-3


Cons:

- no short (up to 22 char)
- short url is not unique
	- if we append a timestamp ?time=xxxx, this could fix it


---

Or we could just the timestamp itself instead of the url for encoding

- if collisions occur, try again

---


# SS1 7 URL Shortener Offline Key Generation

- We can generate the url offline (key generation service) and send it to the server later.



# SS1 8 Network protocols (20:30)

# SS1 11 Horizontal and vertical scaling (15:35)

## Reasons why we need to go for a distributed system:

1. check how much data needs to be stored
	- may need to scale DB and cache tier if size of dats is too large
2. if the number of requests per second is too huge, need to scale for throughput
3. If the response time is too high, needs parallization
4. Availability / Reliability in the face of faults
5. Geolocation - minimize network latency by using multiple servers in different locations
6. Hotspots - disproportional high load on a piece of data 
	- popular articles
	- celeb's social page


## Vertical scaling / scaling up

- Adding more disks, Ram chips, and CPUs
	- cost eventually grows faster
	- has a ceiling

* probably never should recommend this as Google / LinkedIn etc would never do this

## Horizontal scaling / scaling out

- Shared nothing architecture
- Multiple machines

## SS1 12 URL Shortener Scaling for Data Size (33:17)

Watch this one again

# SS1 15 SLOs and SLAs

- SLI - Service level Indicators
	- Correctness, availability, throughput response time

- SLO - Service level objective
	- the targe value or range for an SLI
	- This is why we scale to maintain SLO

- SLA - Service level agreement
	- rebate or penalty for not meeting the SLO
	- a contract with your users

# SS1 16 Latency, Response time and Bandwidth (15:55)

## Latency vs Response Time

### Latency

- the duration that a requestis "latent" (awaiting service, not being served)
- two way RTT (round trip time)
- Network delay

Two parts of latency

1. Transmission = size of message / bandwidth
2. propagation delay = distance / speed of light
3. queuing delay

### Response time

- latency + service time at server

### Bandwidth 

- the number of bits that can be transmitted over the network per second
	- the best performance
- throughput is the actual performance

# SS1 17 Reverse and Forward Proxy (10:17)

### Server side proxy - reverse proxy/sheild

- a load balancer can handle decryption and encryption (load balancer)
- now the app server doesn't worry about de/en cryption (security)

### Client side proxy - forward proxy

- forward proxy is like a super client to handle data for a bunch of clients
	- it keep a copy of a response for multiple clients to get data
- good for poor internet connection; low response time

# SS1 18 Load Balancing

- ten to hundrends of time more communications than the actual app
- increase throughput
- 100k to million qps (queries per second)
- open source software
	- nginx

### Sending data:

- round robin:
	- request are sent in order
- least # of active connections
- or in combo of the two

### why use a LB?

1. increase throughput
2. increase availability
	- no single point of failure

Having multiple LB can do health checks between each other

- two different machines
- passive back ups
- DNS-based load balancing to prevent down time


# SS1 19 IP Anycasting (18:50)

- A message sent to an unicast can be sent to every member of the group
- Ip Anycast is only one a direct member of the group

BFS can be used to find the shortest path in a graph.

# SS1 20 CRUD (11:45)

CRUD (Create, Read, Update, Delete) is an acronym for ways one can operate on stored data.

# SS1 26 Cache Reads and Writes (22:28)

# SS1 27 LRU Cache (45:56)


> Leetcode question: https://leetcode.com/problems/lru-cache/

> Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

> Implement the LRUCache class:

> LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
> int get(int key) Return the value of the key if the key exists, otherwise return -1.
> void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
> The functions get and put must each run in O(1) average time complexity.

``` swift
func get(key: Int) -> Int {
	if key is not in hmap:
		// cache miss
		return -1
	// key exists in cache
	// extract the key node and push it at the head of the doubly-linked list
	return head.value
}

func put(key, value) {
	// case 1 key exits in cache (update kv)
	if key is in hmap {
		hmap[key].value = value
	}
	// extract the key node and push it at the head of the doubly-linked list

	// case 2 key doesn't exist in cache (insert kv)
	// if cache is full, then purge out the LRV node
		// from both hash table and doubly linked list
	if currsize == capacity {
		delete hmap[tail.key]
		penultimate = tail.prev
		if penultimate is not null {
			penultimate.next = null
		}
		tail = penultimate
		delete
		currsize -= 1
	}

	// insertion code
	if head is null {
		head = node(key,value)
		tail = node(key,value)
	} else {
		newNode = node(key,value)
		newNode.next = head
		head.prev = newNode
		head = newNode
	}
	hmap[key] = head
	currsize += 1

}

```