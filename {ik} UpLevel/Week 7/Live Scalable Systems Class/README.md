# Live Scalable Systems Class 1

## Agenda

<details>
	<summary>Read more</summary>

- Difference between DS/Algo & scalable systems
- Problem solving framework recap
- Design Instragram clone
- Design Uber clone

</details>

## Difference between DS/Algo & scalable systems

<details>
	<summary>Read more</summary>


### DSA

In DSA, for a given computation problem

- design a correct and efficient algo
- code it up

Assumptions:

- Only one user
- program will only run once
- Unbo unded CPU / RAM to solve the problem

### Scalable Systems

In system design:

- Your DS/Algo program is now a service in system design
- The users of the service known as clients
	- may want to execute remotately
	- will need to request your server machine to run the program using the inputs they send over the network
- your server machine
	- needs to send the output of a request as a response over the network
	- needs to always be actively listening for requests
- your program needs to be scalabe if it can handle a huge growth in the load (number of concurrent requests) without sacrifcing the response time

The standalone program is converted into an online service and we will see how to build the online service.

### Scalability and its types

- scalability is property of a system to handle growing amounts of traffic
- the scaled program with client server will act as an online service
- in case the program is scaled offline, it is known as bath processing
- when the input is not fixed and comes as a stream, it is known as stream processing
	- network of sensors constantly sending data
	- solar panel
	- GPS

</details>


## Structure of the interview (most important)

<details>
	<summary>Read more</summary>

You'll be asked to design something

### Steps:

1. Functional requirements
	- what the system should do
2. Ask technical requirements 
	- how your system should scale
	- and traffic requirements
3. List of microservices
4. Draw a logical diagram
	- MIDWAY POINT OF THE INTERVIEW
5. Discuss which microservices to focus on (10 minutes)
	- this will be the one to deep dive into
		- Application, Storage, cache tiers
		- Scale the app, storage and cache tiers
	- 1 or 2 microservice
6. A solution recap

### 1. Functional requirements

<details>
	<summary>Read more</summary>

High level points:

- What the system does for the user
- "As a user I want to..."
- MVP
- Required inputs / outputs

1. gather functional requirements
	- the question will be open-ended so this is important
2. Design constraints / scalability requirements
	- number of users, transactions per second
	- the interviewer may give them or may ask the candidate
	- Can be collected at a later step

The more senior the position, the longer the time should be spent here

</details>

### 2. Ask technical requirements 

<details>
	<summary>Read more</summary>

High level points:

- How many users?
- What are the time patterns of users (spikes)?
- What is the data they are trasferring?
- What is the average size of the data?

After these questions, you should have all the details for scalability

</details>


### 3. List of microservices

<details>
	<summary>Read more</summary>

High level points:

- Turn user story + info from tech requirements = microservice

Definding microservices of the system - A microservice:

- is an independently deployable service modeled around a business domain
- loosely coupled, you can change on MS and deploy it into a production without affecting other ms
- Samll and focused on doing on thing well (owned by a single 2 pizza team)
	- only need 2 pizza to feed the whole team
- communication with each other usering language independent network APIs
	- rest with HTTP

Bucketize the functional requirements into microservers

- cluser the ewquirement so that each cluser can be handled by a differen time
- if the funtional requirements don't look the same, put them in different ubkcets
- subject and depends on the individual
- after doing tis, you'll will know whether it is a depth oriented problem (01 MC) or breadth-riented problem (many MS)
	- depth may have pseudocode

</details>

### 4. Draw a logical diagram

<details>
	<summary>Read more</summary>

High level points:

- boxes and arrows showing data flow

Design the logical arch

1. block diagram with one block for each MS
2. draw and explain the date/logic flow betwewn them
3. Rule of Thumb: 
	- if client (user or MS) is waiting for repsonse from the MS, use HTTP/rest aPI
	- if the client microserve does not expect an immediate reponse from the server MS, use a message queue (pub-sub) which is its own MC
	- if data transfer is offline, you may use batch ETL (extract transform load) jobs

High level block diagram:

#### simplest single MS

![dai1](./images/dai1.png)

#### Multiple MS w/ message service (pub sub) to MS5/MS4

![dai2](./images/dai2.png)

#### Multiple MS w/ message service to MS5/MS4 + ETL job

![dai3](./images/dai3.png)

#### Multiple MS w/ message service to MS5/MS4 + ETL job + profile/analytics

- auth / analytics these are always going to be the same and not something usually deep dived into

![dai4](./images/dai4.png)

---

- API is an agreement on how to talk to a microservice
- Having an api for data access instead of talking to the DB direction allows for api to stay the same but DB can change and the user will never know

</details>


### 5. Discuss which microservices to focus on

<details>
	<summary>Read more</summary>

High level points:

- discuss app, storage and cache tiers
- then scaling
	- you'll know how many servers you'll have for each tiers

I pick which MS to discuss but the interviewer might say let's look at something else

#### High-level MS arch

- In general each MS can have up to three tiers
	- backend tier with business logic (App) where you signle machine code goes
	- cache tier for faster response time cache
		- reduce the load on data storage
		- subset of database tier but can be stored in any format / DS
		- faster data access
	- storage tier for data storage and retrieval (DB) 
		- stored in row major / col major / files
		- movies / unstructed formats

NOTE: we don't worry about the front end

Deep dive into a MS diagram:

- cache has data

![dai5](./images/dai5.png)

- cache doesn't have 

![dai6](./images/dai6.png)

NOTE: app, cache and storage have their own load balancers


1. if there are many pick one
2. constant amount of time
3. only one ms there may be a coding
4. for each MS
	1. solve each tier logically
	2. ID data model
	3. discuss how data will be stored
	4. propose API
	5. propose how APIs work in each tier

Propose flow access tier 

- most technical
- non-determinstic
- changes from prob to prob
- most thinking part

Once you describe how it works for one user, scale it up

- scale app
- then cache
- then storage

#### In each MS id the need for scale:

- need to scale for throughput
- need to scale api parallelization
- need to remove hotspots
- support for geo-location
- scale for storage

- solve algebracally first then put in the numbers
	- algebrac formula

#### Vertical scaling - get a bigger computer

- easiest way to scale to 
- one powerful machine (with lots of CPU, RAM, disks)
- costs eventually grows faster than linearlly
- has a ceiling
	- single point of failure
- speed of cores, competing process, network

#### Horizontal scaling - getting more computers

- change program to coordinate tasks on multiple machines across multiple networks
- web apps threads are stateless, can push the state into a database
- shortcomings:
	- complex (manage consistency, availabity debugging)
	- if not arched properly, can be fragmented servers
		- improper division of workload

Propose a distrubuted system - always Horizontal

1. scale the tier and propose the distibuted system
	- most determinstic portion
	- steps
		- draw a generic arch
		- if app servier tier and stateless use round robbint
		- if cache
			- suit requirements of scale
			- partition
			- aglog to place shards
			- explain APIs work in shard settings
			- propose replication
			- propose CP or AP (algo for CAP theorem do not change from prob to prob)
				- SS1 24 CAP Theorem
				- CP - wait on data until it we get all data
				- AP - data available now but not all data
	- this is how each microservice looks within a single data center, either on premise or VPC in cloud

#### CQRS Pattern

![dai7](./images/dai7.png)

####Stateless vs Stateful

https://www.virtasant.com/blog/stateful-vs-stateless-architecture-why-stateless-won


</details>

### 6. Recap

<details>
	<summary>Read more</summary>

High level points:

- summary of what you put together

</details>

</details>



## Instagram Application

<details>
	<summary>Read more</summary>

Step 1: Grathering requirements
- view upload photos
- like comment on photos
- search for photos

non. func requipments
- service needs to be highly avaialbe (prefer availablity over consistency)
- SLA / SLO for feed gene,
	- y ms to view a photo
- the system needs to be highly reliable
- 1 billion users
- 500 million daily active users
- 100 photos per second
- 200kb per file

Id API acount to func requirements

1. user actions
	- view photos/id/userid
	- view photos/user
	- post photo
2. user should be able to like comment on photo
	- likePhoto / photo_id/user_id
	- postComment / photo_id, user_id
3. user should follow and uunfollow

4. Generate hom fooed
	- getFeed
5. should be able to search for photos or account
	- searchAccounts
	- searchPhotos
6. Auth and creation out of scope
7. live and stories out of scope

#### How do organize the info in memory?

1. fetch photos
2. fetch user info
3. like and comments
4. follow and unfollow 

#### Build a model to functional requirements - DB

![dai8](./images/dai8.png)

![dai9](./images/dai9.png)

- why store the size of the storage?
	- because we'll use it to calculate the shards later

#### Define the MS

- make sure they match what we wrote in functional requirements

![dai10](./images/dai10.png)

#### MAke a logical diagram

![dai11](./images/dai11.png)

- should be bidirectional

Add databases and caches:

![dai12](./images/dai12.png)

- CDN: image storage

#### Post services


![dai13](./images/dai13.png)

#### recall scaling up the solution

![dai14](./images/dai14.png)

![dai15](./images/dai15.png)

go through a checkless to determine which scaling up to focus on


#### Post service 

IMPORTANT: THE MATH!

![dai16](./images/dai16.png)

![dai17](./images/dai17.png)

Pb = petabytes
	1 PB	1,000 TB

#### distributed architecture

![dai18](./images/dai18.png)

Q: Which could we shard on?
	a. userID
	b. photoID <-- this one

Why? We want the data to be evenly distributed across the data shards

- The photosIDs are always increasing

![dai19](./images/dai19.png)


#### App tier - architecture

- could use round robin here

![dai20](./images/dai20.png)

- Heartbeat is a lightweight daemon that you install on a remote server to periodically check the status of your services and determine whether they are available

#### Cache Tier - architecture

![dai21](./images/dai21.png)

- load balancer is smarter here 
	- verifies where the key should be sent to
- cache server is the different shards
- cluster manager instructs the LB on status 


#### Storage tier

![dai22](./images/dai22.png)

- pretty much the same as the cache tier

#### View service - arch

![dai23](./images/dai23.png)

- image should be faster than the likes and comments

#### View service - scale up solution

![dai24](./images/dai24.png)
![dai25](./images/dai25.png)

IMPORTANT: MATH

#### cache tier

![dai26](./images/dai26.png)

- 500 million meta data records
- 100,000 sec is 5 days?

![dai27](./images/dai27.png)

---

## News Feed

![dai28](./images/dai28.png)

- FanOutService - pub out service

#### How to gen the news feed

![dai29](./images/dai29.png)

#### How to poll the data in for the news feed?

![dai30](./images/dai30.png)

#### News feed DB tier

![dai31](./images/dai31.png)

How to scale:

![dai32](./images/dai32.png)

#### News feed app tier

![dai33](./images/dai33.png)

#### News feed cache tier

![dai34](./images/dai34.png)

#### News feed DB tier

![dai35](./images/dai35.png)

![dai36](./images/dai36.png)

---

How to determine when to use 

|	relational		    vs		NoSql	   |
|-------------------|----------------------|
| joins				|			join r/w   |
| analytics			|				       | 
| expensive			|			cheaper	   |


## Search Feed


</details>


## Design an Uber clone

<details>
	<summary>Read more</summary>

### user experience

- ride sharing system
- taxi arrival
- taxi knows the destination 
- taxi delivers
- payment
- feed back

A marketplace to:

- match rider
- match driver

### Functional Requirements

![dai37](./images/dai37.png)

- we need to show where the car is not where the rider is
	- because the rider may not be the same as the person who paid for it

Rider journey:

![dai38](./images/dai38.png)


- pub-sub-queue -> vehicle tracking service -> location dashboard MS
	- where it's locationed
	- where it is on the map


### Micro services

![dai39](./images/dai39.png)

- complexity of finding the vehicles
	- hard do the object finding function
	- math using coords lat/long
		- use geo hash (string rep of location)

![dai40](./images/dai40.png)

- 8 characters required is enough for couple of feet on earth

![dai41](./images/dai41.png)

### Vehicle tracking microservice

![dai42](./images/dai42.png)

- write back caching is faster on api later
	- reduces lose

### storage scaling

![dai43](./images/dai43.png)

IMPORTANT: MATH

- 2 geo hash - previous and current location

### App tier

![dai44](./images/dai44.png)

IMPORTANT: MATH

### cache tier

![dai45](./images/dai45.png)

### DB tier

![dai46](./images/dai46.png)

### storage Scaling

![dai47](./images/dai47.png)

![dai48](./images/dai48.png)

## Location based

![dai49](./images/dai49.png)

## How is ETA calculateD?

- we have map data -> rounting info & traffic analysis -> ML
	- so use machine learning
---


</details>

# End of class

NEED to calculate:

- Api servers needed
- api storage
- the cache
- streaming and network bandwidth

Useful data:

![dai50](./images/dai50.png)

Need to know: https://gist.github.com/jboner/2841832
