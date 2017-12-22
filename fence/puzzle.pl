:-include('gamePrinting.pl').
:-include('game1.pl').
:-use_module(library(clpfd)).
:-use_module(library(lists)).

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
  labelingVars(Lines),
  labelingVars(Columns),
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

cellRestriction([], _, _).

cellRestriction([[Digit, Line, Column] | Tail], Lines, Columns) :-
    nth1(Line, Lines, TopLine),
    element(Column, TopLine, Top),
    NewLine is Line + 1,
    nth1(NewLine, Lines, BottomLine),
    element(Column, BottomLine, Bottom),
    nth1(Line, Columns, Col),
    element(Column, Col, LeftCol),
    NewColumn is Column + 1,
    element(NewColumn, Col, RightCol),
    sum([Top, Bottom, LeftCol, RightCol], #=, Digit),
    cellRestriction(Tail, Lines, Columns).

pointRestriction(Lines, Columns) :-
 pointRestriction(Lines, Columns, 1, 1).

pointRestriction(_,_,CurrLine,CurrColumn) :-
  dimensions(NoLines, NoColumns),
  OverLines is NoLines + 1,
  OverColumns is NoColumns + 1,
  CurrLine = OverLines,
  CurrColumn = OverColumns.
  
pointRestriction(Lines, Columns, I, J):-
  dimensions(NoLines, NoColumns),
  nth1(I, Lines, Line),
  (
    J < NoColumns,
    element(J, Line, RightLine),
    A=RightLine
  ;
    A = 0,
    true
  ),
  (
    J \= 1, OldJ is J - 1,
    element(OldJ, Line, LeftLine),
    B=LeftLine
    ;
    B = 0,
    true
  ),

  (
    I < NoLines,
    nth1(I, Columns, Down),
    element(J, Down, DownCol),
    C=DownCol
    ;
    C = 0,
    true
  ),
  (
    I \= 1, OldI is I - 1,
    nth1(OldI, Columns, Up),
    element(J, Up, UpCol),
    D = UpCol
    ;
    D = 0,
    true
  ),

  (
    J < NoColumns,
    NewI is I,
    NewJ is J + 1
    ;
    J = NoColumns,
    I = NoLines,
    NewJ is NoColumns + 1,
    NewI is NoLines + 1
    ;
    J = 7,
    I \= 7,
    NewJ is 1,
    NewI is I+1
  ),
  ((A+B+C+D#=2) #\/ (A+B+C+D#=0)) #<=> Bool,
  Bool #= 1,
  pointRestriction(Lines, Columns, NewI, NewJ).
