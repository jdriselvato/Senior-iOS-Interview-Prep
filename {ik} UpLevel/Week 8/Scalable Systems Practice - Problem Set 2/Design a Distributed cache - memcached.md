# Design a Distributed cache (e.g. memcached)

[This problem may have been done in the class. Whatever the instructor taught you supersedes the following]

Read up on single-server cache first
Distributed cache needs multiple shards (server). How many shards are required depends on what is the most QPS you can handle on a single machine. For memcached, one of the most popular distributed caches, it's 50KQPS default. 
Distributed/Consistent hashing is a good mechanism to implement a distributed cache.

Important: In an interview, it is fair game to be asked to code a basic distributed hashing mechanism e.g. consistent hashing (see links below).

It is likely, that you may be asked to "design memory cache". That doesn't mean "memcached", the popular distributed cache. "memory cache" is just a lazy way of saying - design cache on a single server and then think about distributed. Mostly distributed. 

Reading pointers:

This one is AMAZING: http://codecapsule.com/2012/11/07/ikvs-implementing-a-key-value-store-table-of-contents/

https://www.quora.com/Whats-the-maximum-throughput-in-queries-per-second-for-memcached-with-small-object-sizeshttp://www.tom-e-white.com/2007/11/consistent-hashing.html

https://ivoroshilin.wordpress.com/2013/07/15/distributed-caching-under-consistent-hashing/ [Java code]

Numbers every engineer should know: https://gist.github.com/jboner/2841832

---

# Step 1: Functional requirements

### Functional requirements
- store k-v pairs
- unique keys
- keys:
	- primitive types: int, double
	- OR string, 1kb text
- values: complex objects
- CRUD: operations
	1. GET (key)
	2. PUT (key, value) : ensures key does not already exist
	3. UPDATE (key, value): ensures key exists
	4. DELETE (key)
- TTL on each K-V
	- SLA of expired keys on TTL is 24 hr

### Non-functional requirements
- 10^9 KV pairs
- 2k writes/sec (QPS)
	1. PUT
	2. UPDATE
	3. DELETE
- 100k reads/s QPS
- Value size: <= 10KB

# Step 2: List of Microservices

- CRUD: operations
	1. GET (key)
	2. PUT (key, value) : ensures key does not already exist
	3. UPDATE (key, value): ensures key exists
	4. DELETE (key)

# Step 3: Logical Diagram

### put/delete/update

``` 
[app] -> [storage]
```

### read

```
[app] -> [cache] -> [storage]
```

- A change log between cache and storage with a listern-queue
- if it's a write intensive system, make sense to have an in-memory updateable cahe on both read and write

# Step 4: MS deep dive

## put/delete/update MS

### Data model

- primary key index: 1 kb
- value: 10kb
- ttl: 4b
- creation time: 8b
- update time: 8 b
- total: 12KB

### Server

- 8 core, 128 gb ram, 2tb HHD
- 1k reads/s
- 200 writes/s

Storage:

- 1 billion keys * 12kb = 12TB data
- 6 shards = 12tb / 2 tb HHD

App servers:

- needs 2k writes/sec
- 200 writes/s possible
- 2k/200 writes/s = 100 app servers

# Step 5: Scalability

Hotspotting:

- if bulk TTL deletion
	- requests from map-reduce jobs are rate limited
- possibly seperate table to store ttl timestamp
	- then a cron job can read only those keys whoe expire and then delete

Scaling type:

- Horizontal scaling of key-space in consistent hashing

# Step 6: Distributed Architecture


--- 

The PDF has code for creating a cache system