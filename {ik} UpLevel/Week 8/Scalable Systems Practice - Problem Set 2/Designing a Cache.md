Designing a Cache

# Step 1: Gather requirements

### functional requirements:
1. store cache - put
2. get cache value

### non-functional requirements
1. scale to user base size
2. 99.9% availibility aka three "9s"
3. minimal latency (100ms)


# Step 2: Microservices

CacheService - K-V with in-memory hashmap

# Step 3: Logical Architecture

```
[cache ms] <-> [in-memory cache] <-> [server cache]
```

### Operations:
1. get(key): 
	- given a key the associated value is fetched
	- maintaining an in-memory cache with the cache SM.
		- if the key exists a value is returned
		- if the key is not present in the in-memory cache, query the cache server
		- server responds with associated value stored in DB
2. post(key, value): 
	- add a K-V pair to the cache or update a value to an existing key
		- the post is successful if there is enough space for the request
		- entires are evicted if not enough space is available
			- use a LRU: LEAST RECENTLY USED approach
		- Some form of TTL: TIME TO LIVE

# Step 4: Deep dive MS 

### Cache MS

- single server multi-threaded envrionemnt
	- multiple threads can update a single key
- mutliple instances of the key
	- avoiding LWW: LAST WRITE WINS
	- CAS: CHECK AND SET

### Time Complexity:
- All the insert key, update key and search key run in O(1)

### Space Complexity:
- hash table uses O(n), each entry in hash table has n linked list entries
	- O(n+n) = O(2n) = O(n)

# Step 5: Scalability

### Scalbility needs:
- Sharding: yes
- Hotspot avoidance: yes
	- load balanced servers sharding
- Geo-distro: maybe
- Throughput: maybe
	- with 3x sharding
- latency: given, yes
	- with cache
- Availability
	- replication
- Consistency
	- cache server