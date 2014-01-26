% Valid digits for hh (in 24h)
hour(X, Y) :-
  member(X, [0,1,2]),
  ( X == 2 ->
        member(Y, [0,1,2,3])
      ; member(Y, [0,1,2,3,4,5,6,7,8,9])).

% Valid digits for mm
minute(X, Y) :-
  member(X, [0,1,2,3,4,5]),
  member(Y, [0,1,2,3,4,5,6,7,8,9]).

% Minute is the palindrom of the hour
palindrom(X, Y, M) :-
  hour(X, Y),
  minute(Y, X),
  M is (X*10+Y)*60+(Y*10)+X.

% Find sibling palindroms with max distance
max1(Z) :-
  findall((X,Y,M), palindrom(X, Y, M), L),
  max2(L, Z).

% Initialize search with first 2 palindroms 
max2([(X1, Y1, M1), (X2, Y2, M2) | L], Z) :-
  Diff is M2 - M1,
  max3((Diff, false, X1, Y1, X2, Y2), [(X2, Y2, M2) | L], Z).
  
% Keep on searching through the list
max3(Z, [_], Z).
max3((Diff1, TF, X1, Y1, X2, Y2), [(X3, Y3, M3), (X4, Y4, M4) | L], Z) :-
  Diff2 is M4 - M3,
  ( Diff2 > Diff1, max3((Diff2, false, X3, Y3, X4, Y4), [(X4, Y4, M4) | L], Z)
  ; Diff2 = Diff1, max3((Diff2, true, X3, Y3, X4, Y4), [(X4, Y4, M4) | L], Z)
  ; max3((Diff1, TF, X1, Y1, X2, Y2), [(X4, Y4, M4) | L], Z)
  ).
