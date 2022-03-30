# Chat (messenger) Server

[This one may have been done in the class. Whatever the instructor taught you supersedes the following]

Design a messenger service like Whatsapp, or Facebook Messenger

What are the challenges associated with this service?
What patterns and frameworks would you use, to scale this service?
Focus on main use cases of messaging with reliable delivery at scale

Reading pointers:

https://www.facebook.com/notes/facebook-engineering/building-facebook-messenger/10150259350998920/
http://highscalability.com/blog/2014/2/26/the-whatsapp-architecture-facebook-bought-for-19-billion.html

---

# Step 1: Functional Requirements

## functional requirements

- direct messaging (one to one chat)
- group messaging
- message status (sent, received & red)
- user status (online, last seen)
- send pictures/videos

## non-functional requirements

- 2 billion monthly active users
- 1 billion groups
- 100 billion messages sent per day
- all messages must persist
- 200 memeber max groups
- messages can have up to 700 characters
- messages at most 16mb
- 10% of all messages have attachments

# Step 2: ID MS

- messaging
- groups
- profile
- data blob
- HTTP long polling - using http protocol by continually poling sever
	- half duplex solution: commmunication can only go in one direction at a time
	- walkie talkies are half duplex
	- phones are full duplex
- websockets - full duplex
	- push and pull

# Step 3: Logical diagram

```
	________________________________________________.
	|			________________________			|
	V			|			 			V			V
[users] <-> [messaging] <- optional <- [group]  [blob]
	^		^	^			   ^	  |
	|		|	|______________|______|
	|		|				   |
	 ->	[profile] --------------

```

- messaging:
	- send/receive to/from user
	- group message requrest -> group
- group:
	- message to each individal -> messaging
- profile:
	- create/update and read profile for user
	- message author -> messaging
	- message author -> group
- blob:
	- send/ receive data (pic/video) to/from user
	- sent http url for blob -> messaging

# Step 4: MS deep dive

- app server
	- handles app logic
	- bound to cpu
- cache
	- need for high throughput data access
	- in memory compute
- storage
	- data persistence

## Messenger MS

```
[app server] -> persistence
```

- API
	- sendMessage(message, recipient, group, blob)
	- updateConversationStatus(conversationID)
- data organization
	- row oriented key-value store
	- index on status
- crux:
	- uses websockets for full duplex realtime comms

### sendMessage
- persists the message to storage
- if group, use fanout from group service 
- obtain recipient server
- if server available, put message on server internal queue
- update status to sent if successfult sent
- data model
	- id, messageid, userid, groupdid, createdat, status

### group
- fanout(groupID, messageID)
	- create a conversation for every profile and send a message to each
- organization:
	- row oriented key value
- data model
	- id, group id, user id

### blob
- api:
	- create(blob) -> returns URL
	- get()
- organization:
	- file system blob store

## Messenger MS need to scale



# Step 5: Scalability



# Step 6: Distributed architecture