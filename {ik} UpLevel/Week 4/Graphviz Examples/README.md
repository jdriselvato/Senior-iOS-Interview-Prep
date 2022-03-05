# Graphviz

Turns out there's a great way to easily visual graphs and create PDFs. I don't know if it'll need this but maybe one day I will, so documenting for future use if I ever need it.

Website: https://graphviz.org

# Install

```
brew install graphviz
```

# Tutorial

There's two types of graphs
1. graph
2. digraph

### Graph

```
graph {
	John -- Joe;
	Jake -- Jim;
	Jim -- John;
}

```

In terminal:

```
dot example1.dot -Tpng > example1.png
```

Output:

![example1](./example1.png)

### Digraph

File: `example2.dot`

```
digraph {
  John -> Joe;
  Jake -> Jim;
  Jim -> John;
  Jake -> John;
}
```

In terminal:

```
dot example2.dot -Tpng > example2.png
```

Output:

![example2](./example2.png)

