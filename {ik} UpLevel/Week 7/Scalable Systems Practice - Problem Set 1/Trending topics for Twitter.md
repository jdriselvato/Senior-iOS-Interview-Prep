Trending topics for Twitter

1. Functional requirements (5 minutes)

- should be able to use hashtags
- what is the time scale? 24 hours
- Do we want real time trending topics? maybe

use case:

- user views a page with a hashtag
- use tavigates to a trending topics page where hashtags with the most views during 24 hours is found

non-requirements

- search / displaying topics
- storing viewing the pages 
- location specific

consistency vs availability:

- service must be available
	- failover / replication

2. Estimation
	
- Twitter has 145M daily users
- users post 500m tweets per day on average
	- 350k w per minte
	- 6k writes per second
	- peak 12 qps per second
	- 2x reads than writes
	- peak load can be 10*12k = 120k reads per second

3. bucketsize functional requirements to microserver (5 minutes)

- API Gateway:
	- load balancing
	- SSL termination
	- Rate limiter
	- requests form user and geo-location depending

- Post service:
	- view topics
	- save topis
	- cache to get th emost recently viewed posts

- Message queue:
	- receives and delivers info about page
	- So we don't affect performance of the topics service with a request that is not needed to get a response with post info

- streaming processing:
	- sliding window algo:
		- https://stackoverflow.com/questions/8269916/what-is-sliding-window-algorithm-examples
	- It gets a hashID and timestamp from the message queue
		- agreegates them and puts them in aggregated trending topic
		- to db ever N minutes

- Trending topics DB
	- format: timestamp | sorted list (hashtagID-count)


```
GetTrendingTopics(timestamp, periodSeconds, count)
```

- Trending topics service:
	- it loads all data from this period from the db.
	- aggregates it using a priority queue and returns a response with the list of hashtags and number of views

Rest API:
`GET /v1/trending?count=100&periodSEconds=3600`

4. Deep dive into trending service and streaming processing (15 minutes)

## Advanced way:

- a z-score method:
	- `z-score = ([current trend] - [average historic trends]) / [standard devation of historic trends]`
	- the standard deviation is a measure of the amount of variaiton or dispersion of a set of values
	- difference between current and average tells us nothing about the devation from aver
	- that's why we deivide the difference between standard deviation
	- whena  z-score is used, the higher or lower the z-score the more abnormal the trend
		- example: if z-score is highly positive then the trend is abnormally rising
		- if it highly negative it is abnormally falling.

- typical 24 hours
	- sliding window processor reads hashtags and timestaps from message queue and keeps a hashmap like:
		- topicID -> array of timeslots

- 