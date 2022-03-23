News Feed

Design News Feed of a high-activity social media site like Instagram

- Design capability for each user to have their own newsfeed.
- What are the issues you would encounter when you need to scale this news feed to millions of users

Reading pointers: 

- http://www.quora.com/What-are-the-scaling-issues-to-keep-in-mind-while-developing-a-social-network-feed 
- http://www.quora.com/Software-Engineering-Best-Practices/What-are-the-best-practices-for-building-something-like-a-News-Feed

---

# Step 1: Gather Requirements

## Functional Requirements

1. upload photos
2. view photos
3. follow / unfollow users
4. gen news feed based on following

## Non functional Requirements

- service needs to be highly available
- acceptable latency:
	- x ms to gen news feed
	- y ms to view photo
- no lsot photos

## Numbers

1. 1 bill total users
2. 500 mil daily users
3. 1000 new photos per second
4. 200kb per photo
5. avg numb of timelines loads per user: ~10

## API requirmeents

1. upload and view photos
	- viewPhoto(photo_id, user_id)
	- viewPhotos(user_id)
	- postPhoto(user_id, photo, location, timestamp, title, tags[])

2. follow / unfollow users
	- follow(follwer_id, followee_id, timestamp)
	- unfollow(follow_id, followee_id, timestamp)

3. News feed gen
	- genFeed(user_id, time_stamp, batch_size, batch_range[])

## Data model:

- Photo Table
	- photo_id: Int64
	- user_id: Int64
	- description: char64
	- image_path: char64
	- thumbnail_path: char64
	- lat: double
	- long: double
	- timestamp: unix timestamp

- User Table
	- user_id: Int64
	- name: char32
	- email: char32
	- create_time: unix timestamp

- Follow table
	- follower_id: Int64
	- followee_id: Int64
	- timestamp: unix timestamp

- Newsfeed table
	- user_id: Int64
	- feed_item_id: Int64
	- photo_id: Int64
	- timestamp: unix timestamp

# Step 2: Defining Microservices

- viewService
- postService
- followService
- newfeedService
- accountService

# Step 3: Logical block diagram

```
				API Gateway / Web servers
						|
		________________|____________________					
		|		|		|			|		|		
	Follow    Post    Newsfeed    view   account
```

# Step 4: Post service

- Tiers: app server tier, cache, storage
- Folow of APIS
	- phone app converts photo into format and resoltuion
	- app asks for a signed url
	- server creates meta-data in db and returns signed URL
	- app directly stores image in image storage user the signed URL
	- app communicates success or failure to the server
	- server updates meta-data record
- data model
	- K-V pair
		- k: photo_id
		- v: description, image_path, etc
- cache tier:
	- not required
- how to store in storage tier
	- as a row oriented k-v store
- APIs
	- postPhoto(user_id, location, timestamp, etc)
- algos
	- generate photo_id
	- generate signed URL
	- create(k,v) CRUD
