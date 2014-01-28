# Summary

This project is a chrestomathy to solve the following problem: Find the two consecutive "palindroms times" with the biggest time difference. Examples of palindrom times are 00:00 or 10:01; these two are not consecutive because, for example, 05:50 is in between. (We should also be careful to observe that the last palindrom time during a given day is followed by the first palindrom time during the next day.)

# Solution

It happens that the solution is ambigious:

* 05:50 -- 10:01
* 15:51 -- 20:02

The difference is 251 minutes in both cases.
