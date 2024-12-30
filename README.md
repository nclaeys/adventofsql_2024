# Advent of SQL 2024

Here are my solutions for solving the Advent of SQL challenges. 
The challenges for each day can be found [here](https://adventofsql.com/)

After a month of solving the challenges, I have improved my SQL knowledge quite a bit, which is wh I can recommend it to everyone.
Next to the solutions, I also blogged about my experience, which can be found [here](https://medium.com/@niels.claeys/what-a-month-of-sql-challenges-taught-me-f84879091182)

For almost all exercises I used the same postgres docker image to test my queries:

```
docker run -e POSTGRES_USER=adventofsql -e POSTGRES_PASSWORD=santa -p "5432:5432" --name adventofsql -d public.ecr.aws/docker/library/postgres:13-alpine
```

To test my queries I used both datagrip of Intellij as well as psql to load the test data. To use psql to connect to your docker container run:
```
psql -U adventofsql  -p 5432 -h localhost -d postgres
```

## Extra notes on some days


### Day 3
No solution for day 3 as I did not want to learn how to parse XML in SQL. I do not see a real-world usecase for persisting xml blobs so skipped this day.

### Day15

For this day, I couldn't use my regular docker image so I used the one from postgis.
I used the following command to launch the image:

```
docker run -e POSTGRES_USER=adventofsql -e POSTGRES_PASSWORD=santa -p "5432:5432" --name adventofsqlpostgis -d postgis/postgis:13-3.5-alpine
```

### Day17

This day I think the data was wrong. There is an entry for New york timezone which results in no solution possible.
I deleted that entry to find a 1 hour overlapping meeting.

### Day18

This day I struggled with the wording of peers. I initially interpreted as both people at the same level and having the same manager.
Based on the example it however only looked at the level, which is why I only considered that without checking they have the same manager.
For me the wording is ambiguous, not sure what to make from it.

### Day20

Here the instructions are also a bit ambiguous in my opinion. We need to look for the distinct keys in the key-value pairs.
First attempt returned an url which used twice the same key (utm_source) which is why it was not correct.

