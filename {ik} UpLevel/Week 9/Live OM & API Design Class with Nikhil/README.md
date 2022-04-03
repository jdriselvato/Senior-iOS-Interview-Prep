# Live OM & API Design Class with Nikhil

- object-oriented design & API design

Agenda 

1. Q & A 
2. Game plan for design interviews
3. 2-3 interview questions

---

## Goals for Homework

<details>
  <summary>Click to expand!</summary>

- treat OO & API part as two separate questions
- have enough to say
	- trade offs
	- other layers; 
		- persistence
		- security
	- alternatives
- fit everything in 35 minutes
	- organize your thoughts
- choose a few patterns to memorize
- look for similarities in questions


</details>

# 1. Q & A about prep interviews

<details>
	<summary>Click to expand!</summary>

1. Why?

- main benefit is in work people will explain "lets use this pattern" and you already know it.
	- people in the prime of there careers quiz you on these to see if you are worthy
- "Find the design pattern" - in the take home problem
	- so knowing the different ones will help you explain your code
- memorize 3 or 4 of the patterns - later

2. how to memorize these?
- memorize an example not the description


## List of subsitution:

- anything animal does, dog has to do.
	- every animal `eat()`s

```
[animal]
[ eat()]
[move()]
	^
	|---------|--------------|
[ DOG  ]	[chicken]  |   [worm  ]
[ eat()]	[ eat() ]  |   [eat() ]-----------[throw an exception]
[move()]	[move() ]  |   [move()]
                       |
                       |
                    [sponge]
                    [ eat()]
                    [move()]------[throw an exception] because sponge don't move

* move requires an old position != new position
```

- worms don't eat the same way as other animals (pre and post conditions)
- sponges don't move, throw an exception

## Command pattern

- undo / redo feature
- paste / copy feature

---

Two way to reuse existing behaviors

1. inheritance
2. composition

**Class inheritance**

- class inherits it takes all behaviors from its parents

``` swift
class Device {
    let name: String
    let operatingSystem: String
}

class Smartphone: Device {}
class Computer: Device {}
```



**Composition**

- protocols

``` swift
protocol SystemProtocol {
    var operatingSystem: String { get }
}

protocol Nameable {
    var name: String { get }
}

struct Smartphone: Nameable, SystemProtocol {
    var name: String
    var operatingSystem: String
}

struct Camera: Nameable {
    var name: String
}
```

Draw backs:

- inheritance lets allows for overriding
- 

## State vs Behavior

- **state** is data or values
- **behavior** is the methods

## Is a clsss a factory for object construction?

</details>

---


# 2. Game plan for design interviews

<details>
	<summary>Click to expand!</summary>

*Coding interview game plan*

1. listen to quesiton
2. find brute-force solution
3. refine solution until optimal time solution is found
4. speak about time complexity and space complexity
5. write code / test code

*Design interview game plan*

- biggest failure is time management; you are the master of your own time.
- 45 minutes long but only 40 minutes to 35 minutes after chitchat
- Can you design a system effectively?
	- will new features be design properly
- when practicing do something novel

1. Listen to the question *( 3 minutes )*
	- open ended
	- list requirements
2. come up with list of requirements *( 5 minutes )*
	- find requirements
	- invent requirements
	- "easy", "common questions" require special care
3. Design a subset of the system *( 10 minutes )*
	1. basics
		- get you foot in the door
		- just the data
		- components / layers (business logic and persistance)
		- public interfaces
			- API
			- UI
			- hardware
			- workflows / use case / algo
	2. **tips** black out / stuck 
		- use "Abbott" textual analysis
		- every noun is a potential class
			- "Customers purchase chocolate bars"
			- Customer
			- chocolate bar
		- every verb is a potential method
			- "Customers purchase chocolate bars"
			- purchase
		- start with something you know or memorized
			- users and permissions
		- reverse apply a pattern hierarchy
			- composite pattern is a good choice
		- similar problems you know
			- you designed a chess engine, apply same knowledge to poker engine
4. Deisgn the full system *( 15 minutes )*
	- show that it meets all requirements
	- keep a list of todos
		- even if the interviewer adds new requirements add it here to not get derailed
5. *Discuss alternatives* / IMPORTANT *( 5 minutes )*
	- most common area to stand out
	- detail Pros or Cons
	- explain trade offs
	- make decisions
6. Summarize *( 2 minutes )*
	- show all requirements are met
	- whiteboard reviewer friendly
		- add notes
		- delete clutter

**Subset Example:**
 
Design a vending machine

1. data:

```
			[product]
			[-price ]
				^
				|
 	|--------------------------|
 	|						   |
[    drinks    ]			[sweets]
[-needs cooling]
```

2. layers:
	- inventory -> stores the products for sale
	- payment -> accepts coins, returns coins
	- dispense product

3. Hardware:
	- Design pattern: obvserable

```
[paymentObserver]
[  coinInserted ]


[productChoiceObserver]
[productButtonPressed ]


[productDispensor]
[   dispense()   ]
```

4. Squeeze a heirarchy into question / heirarchy pattern

```
		[items]-------|
		  | 		  |
		---------     |
 	   |		 |	 <*>
[Products]		[productGroups]
```

</details>

# 3. 2-3 interview questions

## Design an online spreadsheet

<details>
	<summary>Click to expand!</summary>

## 1. Listen to the question *( 3 minutes )*

Design an online spreadsheet - open ended


## 2. come up with list of requirements *( 5 minutes )*

**Questions to ask:**

- Concurrent users? How many?
- what part of the design?
	- big picture / microservices (scalabe)
	- inner working + classes
	- api design
- use cases / features
	- formulas
	- graphs / images
	- security
	- basic features like rows and columns

**Requirements (answers):**

- rows and columns w/ data
- data can be nums, strings and formulas
- yes, concurrent users

## 3. Design a subset of the system *( 10 minutes )*

- draw an example spreadsheet
	- cell 1A has a number
	- cell 2A has a number
	- cell 1B has a string
	- cell 2B has a formular

- What are the classes? (my idea)
	- this could be a composite pattern

```
		[  spreadsheet   ]
		[   editCell()   ]
			   <*> 1..*
				|
				|
			 [ cell  ]		--- (list of lists or 2d array) / hashmap
			 [ -row  ]
			 [-column]
			   <*> 1..*
				|
				|
		 [value Expression]
		 [ getStringValue ] (gsv) <-- non-mutable
			   < >
			 	|
			 	|
    .------------------------.		
    |			|			 |
  [number]	 [string]	[formula]
```

- Cell would be a hashmap where key is row&column as string
	- could be a tuple
- gsv converts number, string or formula to string
- gsv is non-mutable making it easier for concurrent edits

---

now we have a subset, look at the requirements and determine what needs to be completed.

- rows and columns w/ data: DONE
- data can be nums, strings and formulas: DONE
- yes, concurrent users

How to handle Concurrent users, ideas:

- lock the cell and when edit is done unlock 
	- but lot of comms
- cell edits are atomic
	- last edit should win to prevent conflicts
- it's better to give an ok answer (locking) than stumble over a complex one.

---

Handling formula

- formula class with operators
- binary tree structure formulas

---

TODO LIST:

- values formula of formula change when ref cells are called 
- better implimentation of concurrency

## 4. Deisgn the full system *( 15 minutes )*

```
				[	  SpreadsheetService	 ]
				[editCellValue(request: JSON)]
				[		requestData()	     ]

		[  spreadsheet]			[  sheetObserver  ]
		[   -name     ]			[aggregateChange()]
		[applyChange()]					|
			   <*> 1..*					|
				|				  [cellObserver]			[valueParser]
				|											[ parse()   ]
			 [ cell  ]		
			 [ -row  ]
			 [-column]
			   <*> 1..*
				|
				|
		 [value Expression]
		 [ getStringValue ] 
			   < >
			 	|
			 	|
    .------------------------.		
    |			|			 |
  [number]	 [string]	[formula]
```

- editCellValue uses a vlaue converted to pass request into a value expression
- valueExpression has the object and we replace string in the cell on spread sheed applyChange()
	- now observers update the cells
- cellObserver needs to notify formula cells that they may need to update
	- an aggregate changes

## 5. *Discuss alternatives* / IMPORTANT *( 5 minutes )*

- Instead of spreadsheet worrying about changes a ChangeWriter class could handle it
	- because it'll manage a queue of changes
- last edit wins instead of locking
- A push model 
	- less pulling
	- but can overun

---

# composite pattern

```
		[valueExpression] -----. 
		[				]      |
				|			   |
		.------------------.   |
		|				   |   |
		|				   |  <*>
[constant]				[function]

```



</details>

# Design the API for an e-book shop that is called buy an e-book-reader

<details>
  <summary>Click to expand!</summary>

## 1. Listen to the question *( 3 minutes )*

Design the API for an e-book shop that is called buy an e-book-reader

## 2. come up with list of requirements *( 5 minutes )*

## Requirements:
- browse books:
	- search a book by title, author etc
	- go through categories breadcrums
		- non-function > science > physicls > high energy physics
	- manage shopping cart
		- put books in cart
		- checkout

## Non-requirements
- auth
- payments

## 3. Design a subset of the system *( 10 minutes )*

- technologis for APIs?
	- REST - outside view
	- RPCs - inside between microservers
	- GraphQL - outside view
		- too special atm
	- soap

- What part of the layers can we start with? DEFINE the resources
	- contract
	- REST apis are resource-centric // IMPORTANT
	- Bad:
		- POST /login
			- login is not a resource
			- action is executed
	- Better:
		- POST /session
			- create a user session resource

### Define the resources

- by writing down JSON representation
	- book
	- author
	- categories
	- shopping cart

Book:

``` 
{
	id: int,
	title: string,
	author: [string],
	year: string,
	ISBN: string,
	price: double, // could be a string
	category: [category_id]
	...
}

```

Author:

```
{
	id: String,
	first_name: String,
	last_name: String,
	books: [book_id] // could be ISBNs (concern)
}
```

Category

```
{
	id: int,
	title: string,
	subCategories: [Category],
}
```


Shopping cart

```
{
	books: [books: count],
	total_price: double,
	session: string,
}
```

### Design the full API:
- possible POST / GET / PUT / DELETE

- Books:
	- GET /books
		- with filter:
			- /books?title="X"&title="Y"&pageSize=20&pageIndex=0)
			- /books/{ISBN}
	- user isn't updated or deleting books
- Author:
	- GET /author (Get all)
		- with filter:
			- /author/{author}
			- /author?name="X"&year="Y" + paging
	- user isn't updating or deleting books
- Categories
	- GET /category (all categories)
		- filtering:
			- /categories/{cat_id}/books // returns all books in cat + filter
			- /categories/{cat_id}/children
	- user isn't updating or deleting cats

--- 

Trade offs 

- return size vs number of round trips
- embedded resource vs resource ID
	- do i return the whole thing or just ID
- sub-resource vs top level resource
	- categories
- usability vs maintenance cost
- debuggable vs human-readable
	- using IDs in string vs BookNames etc

---

now we have a subset, look at the requirements and determine what needs to be completed.

- browse books: DONE
	- search a book by title, author etc: DONE
	- go through categories breadcrumbs: DONE
		- non-function > science > physicls > high energy physics: DONE
- manage shopping cart: NO
	- put books in cart
	- checkout

---

- shopping cart
	- GET /cart/{user_ID}
		- returns current shopping card
	- PUT /cart/{session}/books/{book_id}
		- add books
	- DELETE /cart/{session}/books/{book_id}
		- remove books
- checkout - options
	1. POST /cart/{session}?action=checkout
	2. POST /purchases/{cart_id}
	3. POST /cart/{session}/purchase

</details>

# POST class comments

<details>
  <summary>Click to expand!</summary>

- treat mock interviews as real interviews
- complete IK homework questions
- a good interview is a discussion between two engineers
	- you'll do very well in the interviews
- go to tutoring sessions
- go through the homework multiple times
- you know you're ready for the interview when the time is short
	- because there's so much that needs to be done to cover everything

</details>