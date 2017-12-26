:-include('gamePrinting.pl').
:-include('restrictions.pl').
:-include('verification.pl').
:-use_module(library(clpfd)).
:-use_module(library(lists)).
:-use_module(library(statistics)).

puzzle  :-
  dimensions(NoLines, NoColumns),
  length(Lines, NoLines),
  LengthSubLines is NoColumns - 1,
  resizeSubs(Lines, LengthSubLines),
  defineDomain(Lines),
  LengthColumns is NoLines - 1,
  length(Columns, LengthColumns),
  resizeSubs(Columns, NoColumns),
  defineDomain(Columns),
  findall([Digit, Line, Column], cell(Digit, Line, Column), Database),
  pointRestriction(Lines, Columns),
  cellRestriction(Database, Lines, Columns),
  !,
  labelingVars(Lines),
  labelingVars(Columns),
  oneLoopVerification(Lines, Columns, NoLines, NoColumns),
  printing(Lines, Columns).

resizeSubs([Elem], Length) :-
  length(Elem, Length).

resizeSubs([Head|Tail], Length) :-
  length(Head, Length),
  resizeSubs(Tail, Length).

defineDomain([]).
defineDomain([Head|Tail]) :-
  domain(Head, 0, 1),
  defineDomain(Tail).

labelingVars([]).
labelingVars([Head|Tail]) :-
  labeling([], Head),
  labelingVars(Tail).
