# Summary

This project is a chrestomathy to solve the following problem: Find the two consecutive "palindroms times" with the biggest time difference. Examples of palindrom times are 00:00 or 10:01; these two are not consecutive because, for example, 05:50 is in between. (We should also be careful to observe that the last palindrom time during a given day is followed by the first palindrom time during the next day.)

# Solution

It happens that the solution is ambigious:

* 05:50 -- 10:01
* 15:51 -- 20:02

The difference is 251 minutes in both cases.

# The repo's name

On 23 January 2014, the SK2 bar https://www.facebook.com/pages/SK-2-Koblenz/218332751553007, used the problem in a quiz. (Folks were not expected to write a program, but it's fun anyhow to code things up. Finding the valid solution can easily be done with exhaustive human-based search, as there is not even one palindrom for each hour.)