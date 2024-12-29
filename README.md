# Advent of SQL 2024

Here are my solutions for solving the Advent of SQL challenges. 
The challenges for each day can be found [here](https://adventofsql.com/)

After a month of solving the challenges, I have improved my SQL knowledge quite a bit, which is wh I can recommend it to everyone.
Next to the solutions, I also blogged about my experience, which can be found [here](https://medium.com/@niels.claeys/what-a-month-of-sql-challenges-taught-me-f84879091182)

## Extra notes on some days

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

