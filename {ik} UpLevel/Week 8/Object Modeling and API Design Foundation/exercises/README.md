Object Modeling Foundation Exercises

# UML Basics

### Question 1:

What is the relationship between “Vehicle” and “Ship” and how do we express
that in a UML class diagram?

- A ship is a subclass of vehicle
	- "A ship IS-A vehicle"
- Car could also be a Vehcile

```
[vehicle] <- [ship]
```

### Question 2:

What is the relationship between “Book” and “Title” and how do we express that
in a UML class diagram?

```
[BOOK]
[TITLE]
```

- A title is an attribute (instance variable) of the class book

### Question 3:

What is the relationship between “Person” and “Albert Einstein” and how do we
express that in a UML class diagram?

- Albert Einstein is an object (instance) of type Person
- Not inhertance because "AN Albert Einstein IS-A person"

### Question 4:

What is the relationship between “Question” and “Answer” and how do we
express that in a UML class diagram?

```
[QUESTION]
	|
	|
 [ANSWER]
```

- the classes `Answer` and `Question` are associated
- question class contains an array of answer
	- Answers should be it's own class because it probably has attributes different from questions

### Question 5:

What is the relationship between “Building” and “Room” and how do we express
that in a UML class diagram?

```
	a.				b.

[building]		[building]
	|				*
	|				|
  [ROOM]		  [ROOM] 
```

- a. because it's a special case of association
- b. it's correct to say "A room IS-PART-OF-A building"
	- when the building gets destroyed the room is destroyedwith it
	- this is call `composition`

### Question 6:

For each of the letters A, B, C, D, E, find the best match – either a number or the
symbol * (star)

![d1](d1.png)

* No clue what this means

### Question 7:

Which UML class diagrams can be used to model a binary tree?

### Question 8:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

### Question 9:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

An application you are designing has to allow the user to authenticate using one of the following
three methods:

1. With their corporate account using the Security Assertion Markup Language (SAML)
2. With their Google account using OAuth
3. With their phone number, using a onetime token you send them via text message

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Observer, Prototype, State, Strategy, Visitor

- Strategy (doc doesn't have enough explaination of why)

### Question 10:

An augmented reality gaming platform allows users to create little monsters of
different configurations and pin them to geographical locations to interact with other players.

They are running into memory problems keeping all the monster objects in memory. What
pattern would you recommend investigating?

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Observer, Prototype, State, Strategy, Visitor

- Flyweight
	- in implementing this patter, we need to decide which part of each monster's state needs to be stored with the monster object and which part can be externalized to save memory

### Question 11:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

A text message needs to be sent in different formats:

- Clear Text
- Clear Text + Signature
- Encrypted Text
- Encrypted Text + Signature

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Observer, Prototype, State, Strategy, Visitor

- Decorator
	- special attention needs to be made to the order of application of the decorators doesn't change the result
	- (`concrete message` decorated with `encrypted message`) decorated with `signed message`
	- (`concrete message` decorated with `signed message`) decorated with `encrypted message`

### Question 12:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

A server is accepting and processing requests. In “normal mode” it is accepting every request and puts it in a queue. Once the queue grows too big, it enters “panic mode” in which it drops a certain percentage of requests. If the queue is reaching critical size, it enters “DoS prevention mode” in which it drops every request.

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Observer, Prototype, State, Strategy, Visitor

- state

### Question 13:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.
A weather station is keeping track of the temperature and humidity. It displays the last measurements on a display and sends them to a mobile phone application.

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Observer, Prototype, State, Strategy, Visitor

- Observer

### Question 14:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

A web application connects to a server to fetch search results. While the results are loading, it displays the text “Please Wait”. Once all data has been downloaded, it replaces this text with the real result.

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Memento, Prototype, State, Strategy, Visitor

- proxy because we need a way to notify the web app the result has arrived
- observer / future

### Question 15:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

You are writing a chess playing application, in which two players take turns to make moves. Now you want to add an option to take the last move back.

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Memento, Prototype, State, Strategy, Visitor

- command

### Question 16:

Which pattern is described in the text below?

You are writing a phone application that controls a collection of smart home devices. For example, when the user presses the “Wake Up” button, it opens the blinds, turns on the coffee maker, and changes the radio station to the news.

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Memento, Prototype, State, Strategy, Visitor

- Façade

### Question 17:

Which pattern would you use in the situation described in the text below? Draw
a UML class diagram before you look at the answer.

You have a collection of geometric shapes (Triangles, Squares, Circles, ...) for which you have written classes in your favorite programming language. You find yourself modifying a lot of different files, every time you add a new feature (calculate area, calculate circumference, find centroid, ...)

*Answers to choose from:* Builder, Command, Composite, Decorator, Façade, Flyweight, Proxy, Observer, Prototype, State, Strategy, Visitor

- Visitor

### Question 18:

Which of the SOLID principles is violated in this design?

*Answers to choose from:*

- Single responsibility principle
- Open/closed principle
- Liskov substitution principle
- Interface segregation principle
- Dependency inversion principle



### Question 19:

Which of the SOLID principles is violated in this design?

*Answers to choose from:*

- Single responsibility principle
- Open/closed principle
- Liskov substitution principle
- Interface segregation principle
- Dependency inversion principle

### Question 20:

Below is the design for a class that loads a file and verifies that it has the correct
fingerprint (think MD5 or SHA checksum). Which of the SOLID principles is violated in this
design?

*Answers to choose from:*
- Single responsibility principle
- Open/closed principle
- Liskov substitution principle
- Interface segregation principle
- Dependency inversion principle

