The predicate siblings returns pairs of consecutive palindroms (only showing hh) with the difference in numbers of minutes: [70- ((0,0),0,1),70- ((0,1),0,2),70- ((0,2),0,3),70- ((0,3),0,4),70- ((0,4),0,5),251- ((0,5),1,0),70- ((1,0),1,1),70- ((1,1),1,2),70- ((1,2),1,3),70- ((1,3),1,4),70- ((1,4),1,5),251- ((1,5),2,0),70- ((2,0),2,1),70- ((2,1),2,2),70- ((2,2),2,3),28- ((2,3),0,0)] We use the key-value term form with the difference used as key, as this allows us to use an existing sorting predicate.

The predicate siblingsSorted returns the list sorted by the difference: [28- ((2,3),0,0),70- ((0,0),0,1),70- ((0,1),0,2),70- ((0,2),0,3),70- ((0,3),0,4),70- ((0,4),0,5),70- ((1,0),1,1),70- ((1,1),1,2),70- ((1,2),1,3),70- ((1,3),1,4),70- ((1,4),1,5),70- ((2,0),2,1),70- ((2,1),2,2),70- ((2,2),2,3),251- ((0,5),1,0),251- ((1,5),2,0)]

The predicate maxSibling returns the sibling with the maximum difference:

<pre>
?- maxSibling(X).
X = 251- ((1, 5), 2, 0) .
</pre>
