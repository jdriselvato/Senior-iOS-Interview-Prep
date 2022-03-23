# Trending Topics

How would you design "Trending topics", on websites like Twitter or Facebook? We need to do it reasonably realtime. 

# Step 1

- What is the purpose of trending topics?
	- allow users to see popular topics on a feed
- How are trending topics determined?
	- view based
	- voting based
- How are tranding topics viewed?
	- a trending tab
- Is the trending tab catered?
	- Yes
- How does the user get to determine their trending content
	- through followed accounts

Designs constraints:

- 10,000,000 active users per hour
	- ~ 3000 views a second
	- each user has a catered trending topic 
- A single user has on average 500 followings
- Algo would allow for side related followings content to appear based on their followings interest
- Number of items in feed top 100

Functional requirements:

- Ability to view a trending topic list
- Ability to vote on a trending topic
- Ability to share multiple trending topics
- Ability to see new trends on refresh

# Step 2: Microservices

- Trending list MS
- Voting MS
- Sharing MS

Breadth oriented 

# Step 3: Archtecture


Client / Server -> API -> trending list MS -.
					|
					|-> voting		--------| <-> pub-sub <-> cache <-> db
					|
					|-> sharing		--------' 


# Step 4: Microserver deep dive

- Trending list MS
- Voting MS
- Sharing MS

## Trending List MS

### App server tier - logic

- Generating a trending list
- A simplistic approach would be to have an algo that uses time vs voting to determine the ranking. 
	- Time should outweigh voting as old news isn't trending news
- Similar to Hacker News:
	- score = (V-1) / (T + 2)^G
	- where V = votes
	- T = time
	- G = gravity (1.8)
	- -1 on Votes because poster auto gets a vote
	- +2 on time because 0 or 1 to ^ g are constants
- This will allow as time goes by the trending item quickly fades out

- 100 trending topics every 5 minutes
	- likes (4 bytes at base 64)
		- the highest ever liked tweet was around 4 million
		- but on average most tweets probably only get 0 to 10 likes
		40000000 = 5aiA
		0 = AA==
		- https://v2.cryptii.com/decimal/base64
	- trending score (4 bytes)
	- post id (4 bytes interpretted as decimal)
	- Total: 4 + 4 + 4 = 12 bytes per trending item
	- 100 * 12 * 12 time per hour * 24 = 350kb


Notes:
	- Twitter stores around 200 billion tweets a year
	- 4 trillion tweets in 20 years
	- 280 bytes per tweet = 4 TB

### Cache server tier - high throughput data

- storage of the chase is per 24 hours for history on feed
	- analytics might even tell is it's 12
- 350kb * 10000000 = 3.5 trillion bytes = 3.5 terabytes per day

### Storage server - persistence

- only a 24 hour period history in case cache fails
- Horizontal sharing
- AP because we're not trending in real time but by 5 minute blocks

Tiers:
	- app server
	- cache
	- storeage
- Data model: k-v pair
	- k = score
	- v = post id
- APIS
	- get(trending)
	- like(post)
	- share(post)
	- viewed(post)

Scaling:

- Need to scale for storage? yes
	- cache could probably be fine tuned for less time
- scale for throughput?
	- unless it's real time events doubtful. if it is, there can be special trending objects set by the item as high priority
- API parallelization: nope
- Geo-location based: maybe
	- Kpop stuff is extremely popular all over the world. So is that topic off limits? So is it per poster?
