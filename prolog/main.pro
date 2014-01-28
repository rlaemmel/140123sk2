% Valid digits for hh (in 24h)
hh(X, Y) :-
  member(X, [0,1,2]),
  ( X == 2 ->
        member(Y, [0,1,2,3])
      ; member(Y, [0,1,2,3,4,5,6,7,8,9])).

% Valid digits for mm
mm(X, Y) :-
  member(X, [0,1,2,3,4,5]),
  member(Y, [0,1,2,3,4,5,6,7,8,9]).

% Subset of hh with palindrom in mm
hhSubset(X, Y, A) :-
  hh(X, Y),
  mm(Y, X),
  % Add time in minutes relative to day
  A is (X*10+Y)*60+(Y*10)+X.

% Pairs of consecutive palindroms with minute difference
siblings(L2) :-
  findall((X,Y,M), hhSubset(X, Y, M), L1),
  L1 = [H|_],
  pairs(H, L1, L2). 

% Helper of siblings/1; use time difference as key in key-value-pairs
pairs((X2, Y2, A2), [(X1, Y1, A1)], [D-((X1, Y1), (X2, Y2))]) :-
  D is A2+24*60-A1.
pairs(H, [(X1, Y1, A1), (X2, Y2, A2)|L1], [D-((X1, Y1), (X2, Y2))|L2]) :-
  D is A2-A1,
  pairs(H, [(X2, Y2, A2)|L1], L2).

% Siblings sorted by minute difference
siblingsSorted(L2) :-
  siblings(L1), 
  keysort(L1, L2).

% Sibling with maximum minute difference
maxSibling(X) :-
  siblingsSorted(L),
  append(_, [X], L).
