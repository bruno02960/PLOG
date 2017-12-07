:-use_module(library(clpfd)).

vars([A,B,C]).

bug :-
  L=[A,B,C],
  write(L),
  domain(L,1,5),
  A=2,
  element(A,L,X),
  write(X).
