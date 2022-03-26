Scalable System 1 - Timed Test

# Step 1: Functional and Non-function requirements

## functional requirements

1. upload pasted text
2. generate a unique URL
3. return a unique URL <- don't use word URL use key
	- IMPORTANT: we can't generate a unique URL cause urls are www.fb.com/wkelmksd
	- should be key


## non-functional requirements 

1. No downtime ("p" priorty 1 based on prob def) -------------
2. minimum latency ("a" priorty 2 based on prob def)          |----- but one can argue it should be CP cause data being there matter more than if it's not there
3. no data should be lost ("c" priorty 3 based on prob def) --
4. pastes are no bigger than 10MB

p - partitioned
a - availability
c - capability

This is a CP 


# Step 2: Technical requirements 

1. 10MB per paste max
	- IMPORTANT: 10MB is over sizing the DB and a senior dev would get points off for this
	- Find the average based on own experience
		- 10KB or 100KB
2. 1 million new pastes per day
3. custom URLs but not mandatory
	- 6 characters at 64 bytes 0...9, a-z, A-Z & -_
4. no private links
5. The read/write ration is 10:1
6. Default TTL
	- IMPORTANT: if we talk default assign a max
		- 10 years is a legal requirement
		- 2 years for default


# Step 3: Microservices

## API
1. postText(textData, userID) - POST
	- Errors:
		- key taken: 403
		- bad request: 400
2. genURL() -> custom_key  
	- returns to the uploaded url after postText()
3. getText() -> textData - GET
	- shows the original text
	- Error:
		- key not found: 404
3. deletePaste()
	- TTL call on CRON

# Step 4: Logical diagram

## Basic app/cache/server tier for MS

```
[app tier]
	|
	v
[cache tier]
	|
	V
[server tier]
```

- each of these are presumed to have a load balancer

## API logical diagram

```
[pastBin] <-> [cache] <-> [storage] <- [deletePaste CRON]

```

- A single microserver
	- since these are all data MS they can be combined into one
- but it could be 2 MS a read and write one since it's a 10:1


# Step 5: Deep dive Microservice

## postText(textData, userID) & getText <- 1 Microserver AKA `Pastebin service`

### App tier

- Pastebin Microservice
	- write data
	- get data

#### add data

- if custom key is given send it
	- else generate one
```
store.data ->
	- validate:
		<= 10mb
	- set default ttl
	- key
```

- store data and meta data
- add data to cache
	- why shouldn't we do this: if its a server they don't care to look at it after
	- if it's a human, they most likely will look at it afterwards

- if an api_key is provided, send
- ttl
	- store for 10 years 
- returns a gen custom_key

#### get data

- get data from cache else storage
	- check expiration date: 
		- error 404
		- if not found delete data from storage / cache <-- this is an anti pattern NOT GOOD! DON'T DO IT!
	- update cache if found in storage
- return data
	- else 404

#### What does it mean to generate a unique key? - multiple 

- A SHA gens it for us / libraries (easiest practical)
- a server might do it / distributed system (overkill)
- might be accessible at the cache
- own algo

### Cache

- latest stored data
- TTL management on cache
- keyvalu store & full record
- eviction policy:
	- LRU - Least Recently Used
	- LFU - Least frequently used

### Storage

```
store.data(
	data,
	ttl, // timestamp
	api_key, // user.id
	custom_key
) -> key
```

#### DB layer:

- table of rows
- fields: custom_key, data, api_key, ttl 

### Read

```
read.data(
	key
) -> data
```

- if the key has been deleted (ttl) return error 404 / 200 ok

- NoSQL because lot of reads & writes
- SQL for joins
- S3 for large data ()

- Key: data, ttl, api_key, data_pointer (if path to storage)
	- adding the data to the table is fine


# Step 6: Scaling

## WPS / RPS

- wps: 1,000,000 pastes per day / (24 hours * 3600) = 12 wps
- rps: 10:1, 10,000,000 per day / (24 hours * 3600) = 120 rps

## Time to write/read

- time to write: 50ms
- time to read: 20ms cache + 20ms storage + 20ms return data = 60ms

## Data size per day

- data size per day 10,000,000 mb per day max = 10TB per day
	- replicated for latency
	- 1 server for traffice

## Bandwidth:

- wps: 12 * 10kb = 120mb/s
- rps: 120 * 10kb = 1200mb/s or 1.2gb
	-10kb because of average use average for storage and bandwidth not max

- 1 server for bandwidth
	- replication for latancy

- not need to scale


## Servers over 10 years

- (10TB * 365) = 0.365 petabytes * 10 years = 3.65pb
