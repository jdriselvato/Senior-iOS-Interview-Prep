# Interview Prep

My journey through leetcode & Interview Kickstart to get a FAANG+ job

IMPORTANT! I will get into a FAANG+ company

## Leetcode

- [Leetcode problems](<./Leetcode>)

## Interview Kickstart

- [Weekly Material](<./{ik} UpLevel>)

## Resources

### Graph's DFS / BFS

- dfs_template.go by Naveen: [Link](https://gist.github.com/vnaveen9296/f533ceed063d2893095b09bb8a4d1d87)

### Problem Explainations

- Graphs / Trees / Recursion / Sorting / Heaps / Searching: [link](https://zunayed.dev)

### Dynamic Programming

- DP Patterns: [link](https://leetcode.com/discuss/general-discussion/458695/dynamic-programming-patterns)
- DP for Beginners [Problems | Patterns | Sample Solutions]: [link](https://leetcode.com/discuss/study-guide/662866/DP-for-Beginners-Problems-or-Patterns-or-Sample-Solutions)
- Tagged DP: [Link](https://leetcode.com/tag/dynamic-programming/)

### FAANG+ Problems:

- Sean Prashad list: [link](https://leetcode.com/discuss/general-discussion/458695/dynamic-programming-patterns)

### iOS

- https://www.toptal.com/ios/interview-questions

### System Design

- https://www.codekarle.com/ 
- https://www.educative.io/courses/grokking-the-system-design-interview
- https://www.educative.io/courses/grokking-the-system-design-interview/B8rpM8E16LQ
- Latency Numbers Every Programmer Should Know: https://gist.github.com/jboner/2841832

### Scalability

- [Facebook's New Realtime Analytics System: HBase To Process 20 Billion Events Per Day](http://highscalability.com/blog/2011/3/22/facebooks-new-realtime-analytics-system-hbase-to-process-20.html)
- [Thoughts on Time-series Databases](http://jmoiron.net/blog/thoughts-on-timeseries-databases)
- [Designing Data-Intensive Applications Refs](https://github.com/ept/ddia-references)

### Sharding 

- [Horizontal Sharding for MySQL Made Easy @ different companies](https://planetscale.com/blog/horizontal-sharding-for-mysql-made-easy)

### Recommended Books

- [Programming Pearls 2nd Edition](https://www.amazon.com/Programming-Pearls-2nd-Jon-Bentley/dp/0201657880)
- [Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems 1st Edition](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321)
- 


---

### Latency Comparison Numbers (~2012)

| **Name**                           |             |    |         |    |     |    |                             |
| ---                                | ---         | --- | ---    | --- | --- | --- | ---                       |
| L1 cache reference                 | 0.5         | ns |         |    |     |    |                             |
| Branch mispredict                  | 5           | ns |         |    |     |    |                             |
| L2 cachereference                  | 7           | ns |         |    |     |    | 14x L1 cache                |
| Mutex lock/unlock                  | 25          | ns |         |    |     |    |                             |
| Main memory reference              | 100         | ns |         |    |     |    | 20x L2 cache, 200x L1 cache |
| Compress 1K bytes with Zippy       | 3,000       | ns | 3       | us |     |    |                             |
| Send 1K bytes over 1 Gb ps network | 10,000      | ns | 10      | us |     |    |                             |
| Read 4K randomly from SSD          | 150,000     | ns | 150     | us |     |    | ~1GB/sec SSD                |
| Read 1 MB sequentially from memory | 250,000     | ns | 250     | us |     |    |                             |
| Round trip within same datacenter  | 500,000     | ns | 500     | us |     |    |                             |
| Read 1 MB sequentially from SSD    | 1,000,000   | ns | 1,000   | us | 1   | ms | ~1GB/sec SSD, 4X memory     |
| Disk seek                          | 10,000,000  | ns | 10,000  | us | 10  | ms | 20x datacenter roundtrip    |
| Read 1 MB sequentially             | 20,000,000  | ns | 20,000  | us | 20  | ms | 80x memory, 20X SSD         |
| Send pack et CA->Netherlands->CA   | 150,000,000 | ns | 150,000 | us | 150 | ms |                             |


### Notes

1 ns = 10^-9 seconds

1 us = 10^-6 seconds = 1,000 ns

1 ms = 10^-3 seconds = 1,000 us = 1,000,000 ns

### Credit

By Jeff Dean:               http://research.google.com/people/jeff/

Originally by Peter Norvig: http://norvig.com/21-days.html#answers

Markdown edition: https://gist.github.com/sergekukharev/ccdd49d23a5078f108175dc71ad3c06c

### Contributions

Original: https://gist.github.com/jboner/2841832

‘Humanized’ comparison:  https://gist.github.com/hellerbarde/2843375

Visual comparison chart: http://i.imgur.com/k0t1e.png

![visual](http://i.imgur.com/k0t1e.png)