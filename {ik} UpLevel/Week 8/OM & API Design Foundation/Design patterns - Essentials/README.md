# Design patterns - Essentials

Recommended book:

[design patterns elements of reusable object-oriented software](https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612)

---

# Composite Pattern

- composite is a component and can contain other composites

**Example:** a menuComponent

```
	[menuComponent]-----.
		^				|
		|				|
	-------------.		|
	|			 |		|	
[menuItem]    [menu]< >-'
[  text  ]
```


# Decorator Pattern

- Drawing program that can draw shapes
	- then you can draw in different colors
	- add border or not
	- pattern filling or not

 ![img](./d1.png)


# Facade Pattern

- useful to breeze through complex structures
- Example: a compiler

![img](./d2.png)

- 1 entry point and you can skip through the complexity


# Visitor Pattern

- lots of different files 
	- word docs
	- pictures
	- music
- there's certain operations you want to do on those files


# Flyweight Pattern

- used for memory 
	- "good use of the flyweight pattern"
- program that does type setting
	- vars: 
		- font
		- font size
		- position
	- func:
		render()
- to save memory take out the vars and put them in an external state class
	- store all objects in hashmap


# Proxy Pattern

- simple class that greets people
	- func:
		- greet()
- object is protected
- proxy greeter that impliments the same base class


# Command Pattern

- when you need to decouple a peice of code 
	- defer exicution 


# Observer Pattern

- used when needed to keep track of the changes of an object that is changing
- example:
	- mobile phone GPS location


# Strategy Pattern

- exchange algo at run time
- example:
	- have a file that needs to be compressed
	- let run time decide which compression to use

# State Pattern

- example:
	- mobile phone
		- w/ incoming call
		- ring / vibrate / mute


# Factory / Singleton

## Factory 

- factory method 

## Singleton

- exactly one instant of the class

---

# Let's solve a problem

Design a library to work with mathematical expressions, for example:

```
	3 + a(2 + b + c)
```

**Support:**

- constants
- variables
- addition
- multiplication

Features to support:

- evaluate: `a = 2, b = 3, => 3a + 2b = 12`
- simplify: `3a+0 = 3a`

When you are stuck: 

- visual the code
- use textual analysis (abbott's method)
- object graph of an example prolbem

![img](./d3.png)