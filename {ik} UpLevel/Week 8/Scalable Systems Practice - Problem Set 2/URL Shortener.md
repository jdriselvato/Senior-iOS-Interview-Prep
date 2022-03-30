# URL Shortener

[This one may have been done in the class. Whatever the instructor taught you supersedes the following]

Design a URL-shortening service, like Bit.ly, or tinyURL

URL Shorteners will take a URL and shorten it, and vice-versa
The system is intended to be designed for a large number of URLs.
Don't forget to discuss storage requirements and caching

Reading pointers:

http://www.quora.com/What-is-the-architecture-of-a-scalable-URL-shortener
http://blog.codinghorror.com/url-shortening-hashes-in-practice/
http://www.tawheedkader.com/2012/03/how-to-hire-a-hacker-for-your-startup/

---

# Step 1: Functional design requirements

## Functional requirements

- given a long url, generate a unique short url
- given a short url return the original log url
- allow for custom URL
- TTL of urls

## Non-functional requirements

- creates per second: 100
- reads per second: 100
- length of short URL: 7 slots @ 64bytes
	- `A-Z, a-z, 0-9, _, -`
- how many unique urls per year? 10,000,000

# Step 2: List of MS

- A single MS or a depth oriented problem

# Step 3: Logical diagram

```
[app] -> [cache] -> [storage] -> pub/sub (back to app)
```

- pub/sub is it's own MS

# Step 4: Deep dive MS

- App tier
	- app logic
- Cache tier
	- scaling throughput
	- in memory structures
- storage tier
	- source of truth

### Data model
- unique id, long url, ttl, creation time = 12kb
- key: unique ID
- value: long url, ttl, creation time

### APIs
- create(longURL): create(v)
- read(shortURL): read(k)
- CRUD 
	- create(kv), read(k), update(kv), delete(k)

### data organization
- hashmap - inmemory
- row oriented with primary key index - in storage

### Algos:
- create:
	- smart short url creation
	- 64 characters 7 spots = 64^7 = 4 trill unique urls
- read:
	- converts back to unique id
	- sends to cache tier

### determine scalability
- need to scale for storage: yes
	- size of k-v: 12kb
	- pairs generated per second
	- replications
- need to scale for throughput (CPU): no
	- how many calls per second: 
		- 100 reads/s
		- 100 writes/s
	- size of k-v:
		- 12kb
- need to scale for api parallelization: no
	- only a single MS
- need to remove hotspots:
	- when bulk deleting ttl it might be better to run that on a cron
- availabiliy and geo-distribution:
	- 99.9% availability

# Step 5: Scalability

- horizontal partitioning by key using hash functions
	- hash is good for randomness
- subset of keys accompanied with full values in buckets

# Step 6: distributed diagram

