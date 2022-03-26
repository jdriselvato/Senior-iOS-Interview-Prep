# Time Series DB

Design a Time Series Database

Examples of time series values are data points spit out by monitoring and logging services. Periodic values, either single or key-value pairs. Usual queries are aggregate queries e.g. How many times in last 5 minutes did this request take more than 1s?

In theory, any database can be used to store time-series values. But one needs to think hard about how to design that schema. There are some OSS that are tuned just for time-series data e.g. OpenTSDB. 

Reading pointers: 

1. List of possible requirements of a TSDB
https://softwareengineering.stackexchange.com/questions/269590/how-to-efficiently-store-big-time-series-data
https://www.xaprb.com/blog/2014/06/08/time-series-database-requirements/

2. Optimizing a Relational Database for Time Series Data 
https://www.youtube.com/watch?v=X4TfveHzBwM (Short, 5 minute video, but lays the foundation well)

3. Using a columnar database as TSDB
https://medium.com/@hellomichibye/column-oriented-database-draft-part-2-21199a2de18a (A little cursory, but sets the foundation well)

4. Cassandara for Time-series Data
https://academy.datastax.com/resources/getting-started-time-series-data-modeling
https://www.datastax.com/blog/2012/03/advanced-time-series-cassandra

5. Mongo Schema for a TSDB
https://www.mongodb.com/blog/post/schema-design-for-time-series-data-in-mongodb

6. An analysis by an engineer who works in a company that uses a TSDB as their core product:
http://jmoiron.net/blog/thoughts-on-timeseries-databases

---

Possible tools:

- Carbon: https://github.com/graphite-project/carbon
- Whisper: https://github.com/graphite-project/whisper
- Graphite: https://github.com/graphite-project/
- InfluxDB: https://www.influxdata.com/time-series-platform/influxdb/

or column-oriented DBs

- dnymaic number of values per time frame
- multiple values for the same timestamp
- save measurements in the same row (timestamp) as additional columns
	- seen in temperature / humidity data
	- stock tracking prices
- because of the column oriented nature, tables can have 100 columns but the query can access only 5 data point in db by reading the data from 5 columns.

# Column-oriented database: Introduction (Part 1)

Source: https://medium.com/@hellomichibye/column-oriented-database-introduction-part-1-572e5780aebb

# row-oriented approach:

- used in instantiating an object or saving a tuple 

```
name          sex       age
==============================
Alex          male      26
Bettina       female    22
Clara         female    23
Dieter        male      28
Emil          male      29
Frederike     female    27
```

This is how the date is in memory:

```
address 00 |  A l e x \0 m a l e \0 26
address 11 |  B e t i n a \0 f e m a l e \0 22
address 26 |  C l a r a \0 f e m a l e \0 23
address 40 |  D i e t e r \0 m a l e \0 28
address 53 |  E m i l \0 m a l e \0 29
address 64 |  F r e d e r i k e \0 f e m a l e \0 27
```

- `\0` is the Null character and terminates a string.

## predictability

- is it possible to predict the address for each tuple?
	- above we can't predict the address without looking at all the data
	- tuples with avariable length prevent such predictions

## Locality

- for example, computing the average age of our persons we need to look at address 10, 25, 39, 52, & 63
	- that's an issue because it reduces the probability to read the data from memory cache or same block on disk.
- it also complicates any forecasts of the CPU (what memory area we need next).

## On-disk representation

```
File data.txt
    Alex;male;26
    Betina;female;22
    Clara;female;23
    Dieter;male;28
    Emil;male;29
    Frederike;female;27
```

# Column-oriented approach

- How is the data stored in memory:

```
address 00 |  A l e x \0 B e t i n a \0 C l a r a \0 D i e t e r \0 E m i l \0 F r e d e r i k e \0
address 40 |  m a l e \0 f e m a l e \0 f e m a l e \0 m a l e \0 m a l e \0 f e m a l e \0
address 77 |  26 22 23 28 29 27
```

## predictability

- Still can't guess the dieter but we have a dieter (dieter is at array index 3)
- we can easily calculate where we can find his age by added address 77 + 3 = 30 => 28
- if we deal with fixed length types, we can predict exactly where we find our data

## Locality

- to calc the average age, we only need to look at memory block 77-82
- the probability to hit the cache (or block) is very high during iteration

## On-disk representation

```
File name.txt
    Alex
    Betina
    Clara
    Dieter
    Emil
    Frederike
File sex.txt
    male
    female
    female
    male
    male
    female
File age.txt
    26
    22
    23
    28
    29
    27
```

- To calculate the average age we only need to read file age.txt. 
- We only read data that we need to calculate our result!

# Summary
- column-oriented: 
	- increases performance
	- need less reads
	- probability of cache hits are higher
	- easily combine multiple attributes if fixed length types

---

# Column-oriented database: Introduction (Part 2)

## On-disk concept

- Time Series DBs (TSBD) are column-oriented
- Column DBs are ideal for TSDB
	- first column will always be timestamp
	- other attirbutes follow

Example:

```
timestamp       value1     value2
====================================
10:01:00.000    324       34654
11:05:00.000    342       23463
12:17:00.000    446       47232
13:03:00.000    234       60383
14:31:00.000    213       73947
15:14:00.000    342       46286
```

## Assumptions

- Entries are sorted by timestamp in ascending order
- New entries are added at the end of the table
	- natural sorting
- all data types are fixed length like ints, floats, or bools
- all entires in a single column are the same type

## Query

- A query will be selecting on timestamp to limit the amount of data
- since everything is sorted by timestamp:
	- we can use binary search techniques to find the first entry of the result
- easy to calculate the position in every other column for each timestamp

## Big Data?

- paritioning like segments or sharding to support big data

### possible approach:

1. partitioning on day:

```
/
    2014-01-01/
        timestamp.dat
        value1.dat
        value2.dat
    2014-01-02/
        timestamp.dat
        value1.dat
        value2.dat
```

2. Dynamic partitions like every `N` elements:
	- name the paritions as the first included timestamp

```
/
    10:01:00.000/
        timestamp.dat
        value1.dat
        value2.dat
    14:31:00.000/
        timestamp.dat
        value1.dat
        value2.dat
```

## Write concept

- write to multiple files simultaneously
	- timestamp.dat
	- value1.dat
	- value2.dat
- must guarantee all files have the same length (num entries)
	- else we could read N entires from timestamp.data but only N minus M from value1.dat

### New assumptions

- always read from timestamp.dat first
- never read more than length(timestamp.dat) entries from all other fiels
- Always write to timestamp.dat last
- this ensures length(timestamp.dat) > length(value1.dat || value2.dat)

## Read concept

- we only read what we need - fast
- on-disk concept allows only reading columsn we need
- we can compress the data in each column
	- sensor data might not be that different
- Use a MapReduce algo to read in parallel from multiple IO channels 
	- we don't want to read everything into memory to compute a result
	- Some kind of streaming algo
- the DB can rely on the OS to handle IO caching
	- if the DB has to answer querier based on the same file the second query will run fast because the file is still cached

## Summary

- With a few assumptions we created a powerful time series DB
- Implementing the system can be done with modest effort because it relies on OS to handle all the hard stuff

---

# Step 1: Functional Requirements

- Ability to quickly access data sets
- Only read the data we need
- Must support sharding
- Data is stored sorted by appending data
- the latest data is visible on a user dashboard

## Design constraints:

- Storing 100 data points per second synced every 5 minutes
	- 100 data points * 60 seconds * 5 minutes = 30,000 columns
- Store two different sensor's data at the same time for future comparison
- Data will live for 5 years

# Step 2: Define MS

- Microserve
	- syncData(timestamp, data)
	- getData(timestamp)

- a breadth oriented problem

1. syncData - pub/sub
2. data aggregation
	- app server tier
	- in-memory tier (1 day)
	- storage tier (5 years)

# Step 3:

```
[app tier]
	|
	v
[cache tier]
	|
	v
[storage]

```

# Step 4: Deep dive in MS

## syncData(timestamp, data)

- Since data is syncing in real time and we have a dashboard that'll display the current value in real time, we'll have a pub-sub.
- with the large amount of data, the data syncing will be split between the system horizontally.

```
[syncData] <-> [pub-sub] <-> cache <-> storage

```

1. we post messages to a publisher
2. the module retrieves data from a subscriber and the publisher publishes data back to the app dashboard.

### Database structure

1. Time series Database
	- since we are syncing data from multiple devices and storing them at the same timestamp, we can use a column-oriented approach. 
	- This will allow us to read data quickly by only getting data we need
	- Allows for 1000 data points to be stored in a single row
	- can be compressed if the sensors are reporting the same data

- 100 data points * 60 seconds * 5 minutes = 30,000 columns per sensor ever 5 minutes

## getData(timestamp)

- since the data is stored in a column-oriented structure, read is quick.
- The data can be sharded by two groupings:
1. by timestamp

```
01_01_2022_00:00:00:
	sensor1.dat
	sensor2.dat
01_01_2022_00:05:00:
	sensor1.dat
	sensor2.dat
```

2. by N sections named by first timestamp

```
01_01_2022_00:
	sensor1.dat
	sensor2.dat
01_02_2022_00:
	sensor1.dat
	sensor2.dat
```


# Step 5: Scale

- Scale for: 
	- Storage: yes, we can use sharding
	- Throughput: Yes, since data is syncing in real time we use a sub-pub to sync data and show data after it is stored
	- Hotspot: no
	- Availability: Yes, near instant notification
	- Geo-distribution: Yes, if the sensors are globally synced

- Capacity: 
	- 5 minute syncing:
		- 100 data points * 60 seconds * 5 minutes = 30,000 columns per sensor ever 5 minutes
	- 1 second syncing a day:
		- 100 data points * 1 second = timestamp+100 data points per second per row per sensor
		- 100 * 60 * 60 * 24 = ~= 9 million data points a day per sensor * 4 (bytes int) = 35mb per day per sensor
	- sharing across 100 gb
	- saving an entire years worth of data per sensor: 35mb * 365 = 13,000mb = 13gb per year per sensor
		- I suppose scaling depends on how many sensors. Data is pretty small.

- Key/value storage
	key = timestamp
	value = data

# Step 6: Distrubuted architecture

```
[get]  [sync] 	  [dashboard]
  |		|			   	  \
  |     V 				Notify
  |	  [app]					|
  |	    |				  [App]
  |-> [cache]->	[queue]->	|
  	   |				[cache]
	  [DB]					^
	    |					|
	     -> [pubsub] -------
```

## Architecture

- write to cache for sync
- sync to cache to display latest data (pub-sub)
- storage: TSDB

