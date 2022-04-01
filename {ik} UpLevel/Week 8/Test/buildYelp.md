# Designing Yelp
   
Vague, high-level problem statement, as delivered in an interview:  Design a Yelp like web service.
 
What that typically means: 

1. Design a Yelp like service, where users can search for nearby places like restaurants, theaters, or shopping malls, etc. 
2. Given their location (longitude/latitude), users should be able to find all nearby places within a given radius.
3. Users should have a real-time search experience with minimum latency.
4. Our service should support a heavy search load. There will be a lot of search requests compared to adding a new place.
 
 
Deliverables:
Implementation of top-down steps of a system design interview for the use case.
 
Extension 1: Can you identify all the APIs involved?
Extension 2: Can you come up with the database schema?
 
Some clarifying questions you could ask:

1. Would there be updates on the location of an entry? 
2. No, in the system that we are building there would not be any updates on the location of a place after adding in the database.

---

If asked this question they are asking about geolocation / spacial proximity.

[Using geohash for proximity searches](https://gis.stackexchange.com/questions/18330/using-geohash-for-proximity-searches)

learn: Geospatial index

[Food delivery algorithms: Designing a location database](https://www.youtube.com/watch?v=OcUKFIjhKu0)

[Coding Challenge #98.1: Quadtree - Part 1](https://www.youtube.com/watch?v=OJxEcs0w_kE)

[Geosharded Recommendations Part 1: Sharding Approach](https://medium.com/tinder-engineering/geosharded-recommendations-part-1-sharding-approach-d5d54e0ec77a)