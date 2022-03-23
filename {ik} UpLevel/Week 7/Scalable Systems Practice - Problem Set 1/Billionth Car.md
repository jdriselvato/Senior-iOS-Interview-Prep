# Billionth Car

Design a system such that 100 billionth visitor on Google, gets a prize in raffle

i.e. when you think about it, you realize that they are looking for a good method of counting in a distributed manner. 

Distributed counting is a hard problem. Not hard as in not solvable, but hard as in "I didn't realize it can become so complicated just to count!" hard.

Reading pointers:

- Canonical answer (CRDT)
- Reasonably acceptable answer (a bit hand-wavy, but conveys that you know enough): See 'Sharded Counters' in this article http://highscalability.com/blog/2009/2/18/numbers-everyone-should-know.html

In practical systems, this will be mixed with existing data pipelines:

- How FB does it: http://highscalability.com/blog/2011/3/22/facebooks-new-realtime-analytics-system-hbase-to-process-20.html
- How Twitter does it: https://www.slideshare.net/kevinweil/rainbird-realtime-analytics-at-twitter-strata-2011/40-Multiple_Formulas_So_far_we 

(For the adventurous) Research paper: http://arxiv.org/pdf/1307.3207v1.pdf

---

# Step 1: Gather the requirements 

## Functional Requirements

1. Real-time notification to the billionth search query
2. Notify own websocket for session

## Design Constraints

1. 70k search/sec
2. search country redirection
3. geo-location

# Step 2: Define MS

- single MS: counter service
- API:
	- notify_billionth_user()
- Data centers: 
	- USA, Asia, Europe and SA

# Step 3: Draw the logical architecture

```
[App Tier]
	|
	v
[cache Tier]
	|
	v
[storage Tier]

```

# Step 4: Deep dive into MS

## Algo:

1. CRDT Counter:
	- Conflict-free replicated data type
		- a DS which replicates across multiple computers in a network
		- replicates can be updated independently & concurrently without coordination between the replicas
		- always possible to resolve inconsistencies
	- Counter:
		- {DC_USA_0_VAL_0, etc}
		- Row oriented
		- updated in cache / db by cluster manager
		- grow only counter
		- global broadcast needed, eventual consistent
		- DC aggregator app server uses its cache
		- a queue and queue consumer between the search DB and agregator cache ensures neartime processing
2. COLMNAR:
	- each search app server is assigned a value to be updated by the cluster manager
	- after updating in cache, the value is updated in DB replicated within a data center
	- global agg agreegates from DC agg and notifies if billionth number

# Step 5: ID scale

- Scale for:
	- Storage: no, it's only a counter
	- throughput: no 
	- Hotspot: yes, the data is in a single storage
	- availability: yes, near instantly notifications
	- geo-distribution: yes

- Capacity estimates: 70k counter increments per seconds
- 1 counter per data center
- 70k/15 counters = 5k counter increments/send (Still a hotspot)

key: value per DC
search: DC_location_#
query number: DC_location_#

- Shard the counter within the DC
- 5k counter updates per second
	- shard each counter into 10 values
	- 500 counter updates per second

- each value = uint64

key: value per DC shard
search: DC_location_#
query number: DC_location_#

- 15 DC * 10 values each = 150 uint65 -> 1200 bytes

# Step 6: Propose a distrubuted arch

```
		[search] <--------
		/			   	  \
	   V 				Notify
	  [app]					|
	    |				  [App]
	 [cache]				|
	   |				[cache]
	  [DB]					^
	    |					|
	    --> [queue] -> [consumer]

```

## Arch:
- Write-bach cache for search
- aggregator always sums from cache
- search service persists to DB to update counter value
- a queue and queue consumer between search DB and aggregator cache ensures nearline agg cache updates
- Global agg uses a queue and queue consume to gather counts from DC aggs and calculates billionth visit
- notification is near time
	- possible to miss notificaiton
- when near 1 billionth request, use a stricter counting for billionth and notify the end user

Storage: Row-oriented: only a few columns

---

# Moving towards CP:

1. Quorum-based writes
	- Each copy of a replicated data item is assigned a vote. Each operation then has to obtain a read quorum (Vr) or a write quorum (Vw) to read or write a data item, respectively.
2. CP preferred since nearline accurate notification to the billionth query needed
- persistent writes needed for recovery
- DB writes are needed for recovery
- with columar sharded counters, DB writes are around 500 qps
	- Queries per second 
- CRDT may not be able to provide the required DB writes qps.
	- CRDT data centered specific agg can find the billionth and global agg may not be needed.