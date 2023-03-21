# Combine

API to process values over time.

3 main components:

1. publishers - produce values
2. Operators - works with vlaues
3. subscribers - care about values

## Publishers - protocol

- deliver a sequence of values over time
- two associate types
	- output - type of value it produces
	- failure - the error it could encounter
- can have multiple events
- foundation types like `timer` and `URLSession` are now publishers

## Operators

- called on publishers and return the same or different publishers
- sets behavior for:
	- changing values
	- adding values
	- removing values
	- etc
- chainable

## Subscribers - protocol

- what listen to the published events
- two associate types
	- output - type of value it produces
	- failure - the error it could encounter
-

