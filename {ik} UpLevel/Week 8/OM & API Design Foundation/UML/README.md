# OM & API Design Foundation

## UML Class diagram

![img](./d1.png)

1. class name
2. variables
	- we don't need to show data type
3. methods/functions
	- we don't need to show return type
	- or variables

## Inheritance

![img](./d2.png)

- arrow shows inheritance

## Association 

![img](./d3.png)

- this diagram whos that there are two meanings
	- you'll need to be specific during the interview and explain it

## Multiplicity

How many objects particapate in the relationship

![img](./d4.png)

- `*` multiple
- `0..1` a range
- `1..*` 1 or more

- How many pages does 1 book have? 1..*
- How many legs on a 1 table? 3..6

## Aggregation & Composition

![img](./d5.png)

- open diamond is aggregation ownership
	- the wheels are tied to a car but the wheels have their own life cycle
	- if the dies wear out, the car is still ok, just change the tire

- closed diamon is composition ownership
	- room is owned by house
	- if the house is destroyed the room is too

# Tips to remember

- student is a person: draw the arrow the way the sentence is in english

```
[student] --> [person]
```


- The room is part of a house

```
[room] ---<*> [house]
```


- class, room, teacher association

```
	[class]
	   | 1..*
	  < >
	1/	 \1 
[Room]	[teacher]
```
