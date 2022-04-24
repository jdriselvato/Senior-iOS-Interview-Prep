# Parking lot

# 1. Listen to the question *( 3 minutes )*

- Design a parking lot

1. A class diagram, showing relationships with each other where appropriate. Classes should show state and methods. Use any convenient notation. UML is more widely known.
2. Main() method, showing how you'll initialize your system and start using it.
3. Identify the design pattern.
4. A REST API

# 2. come up with list of requirements *( 5 minutes )*

## Requirements:

### Parking procedures

1. what kind of parking lot?
2. push a button to get ticket
3. park your own car in any spot
4. pay before can exit
5. drive your own car out

- understand system behavior are actional requirements

### Nice to haves

- parking security
- some way to maintain the status of the parking lot
	- if full

### Actors

- person parking
- parking lot operator


# 3. Design a subset of the system *( 10 minutes )*

- ID the nouns (classes) and verbs (methods in cases)

1. A class diagram, showing relationships with each other where appropriate. Classes should show state and methods. Use any convenient notation. UML is more widely known.

- https://excalidraw.com/#room=82794bcaf20fef9b9d04,ujMdbtYlpwgOjPX8FcHMVQ

2. Main() method, showing how you'll initialize your system and start using it.

- https://excalidraw.com/#room=82794bcaf20fef9b9d04,ujMdbtYlpwgOjPX8FcHMVQ

3. Identify the design pattern.

- Singleton: parking lot
- Decorator Pattern

4. A REST API

- Payment
	- GET /payment/{ticket_id}
	- POST /payment/{ticket_ID}
		- process payments w/ credit card
		- process payment w/ card
- parking lot
	- GET /ticket/
		- returns new ticket
- floor
	- GET /spots/
	- POST /spots/{ticket_id}?claim=true
	- DELETE /spots/{ticket_id}?claim=false

# 4. Deisgn the full system *( 15 minutes )*

# 5. *Discuss alternatives* / IMPORTANT *( 5 minutes )*

# 6. Summarize *( 2 minutes )*