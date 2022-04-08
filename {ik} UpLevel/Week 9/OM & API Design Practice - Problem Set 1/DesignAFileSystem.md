# Design a File System


Vague, high-level problem statement, as delivered in an interview: Design/Model a File System

What that typically means: Think of a basic file system. Now model it in software. You could think of Unix to make your initial design, but your solution should be sufficiently generic. Identify different entities and create classes for them. Put state in those classes and show relationships.

Deliverables:

1. A class diagram, showing relationships with each other where appropriate. Classes should show state and methods. Use any convenient notation. UML is more widely known.
2. Main() method, showing how you'll initialize your system and start using it.
3. Identify the design pattern

API:

Create a file system API

Start simple, CRUD based first. Don’t try and model it after Linux, because Linux is very complex and is not REST based. Model it after an online file system (think [Box](https://developer.box.com/reference) or [GDrive](https://developers.google.com/drive/api/v3/reference/))

Follow general REST API thought design guidelines

---

# List of requirements

- A class diagram, showing relationships with each other where appropriate. Classes should show state and methods. Use any convenient notation. UML is more widely known.
- Main() method, showing how you'll initialize your system and start using it.
- Identify the design pattern
- Create a file system API

# Design a subset of the system

1. data

```
	  [System]
	  [main()]
		 |						
	[filesystem]<>-------------[manageFileSystem]
		<*>    				   [move(file/folder)]
		 |		   			   [delete(file/folder)]
		 |   			   	   [create(folder)]
		 |					   [override(file/folder)]
	 [systemItem]
		  ^ 1..*
		  |
	.---------------.
	|		   		|
[file]--------<>[folder]-----.
[-name]		 	[-name ]	 |
[-extension]		^		 |
					|--------`
```

2. layers

- filesystem contains systemItems
- systemItems can either be file or folder
	- files have names and extensions
	- folders can have names
- folders may contain files 
- folders may contain other folders
- a more advance filesystem may contain a file manager system
	- including moving files/folders
	- deleting files / folders
	- creating folders
	- presuming other parts of the systm creates files

3. API system:

- GET /filesystem/{session}
	- returns the base level filesystem $HOME
	- returns all $HOME level files and folder
- GET /filesystem/{session}/file/{id}
	- views a specific file from $HOME
- GET /filesystem/{session}/file/{id}
	- views a specific folder from $HOME
	- returns all {id} layer files and folders
		- $HOME/id	
- POST /filesystem/{session}/
	- uploads a file or folder to $HOME
	- if file exists override it?
- DELETE /filesystem/{session}/file/{file_id}
	- deletes file at $HOME
- DELETE /filesystem/{session}/folder/{folder_ID}
	- deletes folder at $HOME

For the sake of simplicity, all files and folders are treated as path in the URL

# Alternatives

- the POST /filesystem/{session}/ could create a copy changing the file name / folder name
- Instead of URLs being treated as file / folder paths we could do:
	- /filesystem/{session}?folder={id} to view folders
		- allowing the server to handle paths
	- /filesystem/{session}?file={id}
		- allowing the server to handle the specific file to read