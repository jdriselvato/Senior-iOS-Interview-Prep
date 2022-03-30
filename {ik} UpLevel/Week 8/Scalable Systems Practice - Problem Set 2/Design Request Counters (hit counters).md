# Design Request Counters (hit counters)

[This problem may have been done in the class. Whatever the instructor taught you supersedes the following]

Design request counters (hit counters)

Count # of visitors in past 1 minute [or 5 minutes, hour, all of the above]

Points to remember

- Understand the use of a Circular buffer
- Concurrency is important. Locking is fine for low volume. For higher volume, you have to do do writes asynchronously.
- When a single machine can't handle it, then use multiple machines. This problem at multiple machines is an entirely different design problem (See Design of Distributed Counters)

Reading pointers:

- http://stackoverflow.com/questions/17562089/how-to-count-number-of-requests-in-last-second-minute-and-hour
- http://stackoverflow.com/questions/18396452/design-a-datastructure-to-return-the-number-of-connections-to-a-web-server-in-la
- http://prismoskills.appspot.com/lessons/System_Design_and_Big_Data/Chapter_03_-_Count_requests_in_last_second_and_hour.jsp

--- 