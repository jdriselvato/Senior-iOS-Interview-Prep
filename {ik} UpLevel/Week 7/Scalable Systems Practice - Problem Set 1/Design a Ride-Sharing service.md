Design a Ride-Sharing service - design uber

# Step 1

- Collect functional requirements:
	- Uber is a ride sharing app with two parts:
		- a taxis driver app
		- a passenger app
	- A taxi driver is able to:
		- accept new rides
		- or reject trips
		- get pick up location
		- get drop off location
		- optimal direction
	- A passenger is able to:
		- book a ride to a specific location
		- see a price for trip
		- book a specific car type
		- pay a driver + tip
		- rate a driver
		- see previous trips
		- see current progress of the vehicle to pick up location
		- see current progress of vehicle to drop off location

- Collect design constraints:
	- Would MVP have optimal directions?
	- Would MVP have complex geolocation based tiering for queuing drivers to passengers
	- How many customers should we expect? 
		- 80 million riders
		- 4 million drivers
	- Number of vehicles registered?
		- 4-5 million
	- Number of trips per month?
		- 14 million?

# Step 2

- Bucketize functional requirements into Microservices
	- Account management (driver and passenger) MS
	- vehicle management MS
	- Location based dashboard MS
	- Trip management MS
	- Payment management MS
	- Reviews MS

(this is a breadth problem)

# Step 3

Notes: pub-sub is used to push real time data between MS

Example: Cars -> pub-sub -> vehicle management -> pub-sub -> location dashboard

# Step 4

Break down of all the MS and their specific tiers.

## Location based dashboard

### App Server tier (app logic)

- real time GPS location updates (every 5 seconds)
- let t = CPU work time in MS from a single thread
	- 1000/t by a single thread per second
- number of concurrent threads in a commodity server = 100-200
- at full capacity 100*1000=100,000/t but we expect 30/40% capacity
	- updating + geo calculation ~ takes 20ms
	- 30,000 (capacity) / 20ms = 1500 rps per server
- 5 million cars, assuming 1 million active
	- 1 million updates per second
- 1,000,000 updates per second ~= 1,000,000 / 1,500 ~= 667 servers
	- distributed globally

### Cache server tier (high throughput data access)

- in memory data per vehicle:
	- VIN (8b)
	- lat / long (8b)
	- 2 geohash (20b)
	- status (1b)
	~= 40byes per vehicle
- number of vehicles ~= 5 million
- total memory 5,000,000 * 40(bytes) = 200,000,000 = 200mb
- Geo location based since other country or even states data is useless in a specific location
	- multiple DB centers based on geo location

### Storage server tier (data persistence)

- in memory data per vehicle
	- VIN (8b)
	- lat / long (8b)
	- status (1b)
	~= 20byes per vehicle (no need for geo hash)
- number of vehicles ~= 5 mill
- Memory requirements per data point:
	- 5,000,000*25 (bytes) = 125,000,000 ~= 125 mb per data point
- 1 year data at minute level detailing:
	- 125mb * (60*24*365) = 125mb * 500,000 = 62,500,000mb ~= 63TB
	- 4TB per db server = 63/4 ~= 16 shards (w/o replication)
- no need to store country or state level data in non-geolocation servers
- Sharding:
	- horizontal
	- geo location based
- CP or AP?
	- AP: does not need to be nanosecond level consistency

### Recap

- tiers: app, cache, storage
- data model: K-V pairs
	- k: location id
	- v: timestamp, list of vehicle + properties + location
- how to store in-memory tier
	- hash table: geo hash as the key
	- list/map of cars within that geohash as values
- how to store in storage tier
	- row oriented
- APIs
	- get(location id) -> all vehicles in given location
	- get(location id, properties) -> search vehicle with certain properties given
	- subscrive(driver) -> to track the movement of the cars near location

---

## Payment management MS

### App Server tier (app logic)

- App payment processing 
- 5,000,000 vehicles, 1 mill active per day
- A driver accepts an average of 5 trips per hour
	- 5 * 1,000,000 * 1 * 24 = 120,000,000 payments per day
- sent data:
	- driver id (6 bytes)
	- user id (6 bytes)
	- trip id (6 bytes)
	- last 4 of selected card (4 bytes)