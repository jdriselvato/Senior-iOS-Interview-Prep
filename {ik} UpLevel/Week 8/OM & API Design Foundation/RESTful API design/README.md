# RESTful API design

whiteboarding REST APIS

- HTTP calls, needs:
	- URL
	- HTTP Verb (GET, POSt, DELETE, PUT)
	- Payload (JSON)
		- draw your payload as JSON
	- Request/Reply

### URL

`https://some.org/some/path`

main thing you want to show is the path, so shorten it to

`/some/path`

*CRUD*
- create (POST)
- read (GET)
- update (PUT)
- delete (DELETE)

**Example:**

User Service

## `POST /users`

- with payload (returned data):

```
{ 
	"userID": 10,
	"username": JohnnyB,
	"status": "Gold"
}
```

- reply:
	- just status code
	- status code + payload

**Status Codes**:

- Good codes:
	- 200: OK
	- 201: created
	- 204: no content (sent ok but no reply)
	- 304: not modified (no changes made)
- Bad codes - errors sending to the service:
	- 400: bad request
	- 401: not authorized
	- 404: not found
- Bad codes - server errors:
	- 500: Internal server error

DATA:

```
{ 
	"userID": 10,
	"username": JohnnyB,
	"status": "Gold"
}
```

- REQUEST: USER w/o userID
- RESPONSE: USER w/ userID

---

## `GET /users`

- REQUEST: nil
- RESPONSE: array of users

```
[ 
	{  "userID": 10, "username": JohnnyB, "status": "Gold" },
	{  "userID": 11, "username": JohnnyC, "status": "Gold" },
]
```

with parameters

`GET /users?status="gold"`


--- 

## `PUT /users`

* could use `POST`

- update with request to a user

---

## `DELETE /users/{userID}`

- REQUEST: -
- response: 204


# hierarchy

examples: 

- POST /users/{userID}/friends
- GET /users/{userID}/friends
- GET /users/{userID}/friends/{friendID}
- PUT /users/{userID}/friend/{friendID}
- DELETE /users/{userID}/friend/{friendID}

---