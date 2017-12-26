oneLoopVerification(Lines, Columns, NoLines, NoColumns) :-
  findFirstLine(Lines, Line, Column),
  findLoop(Lines, Columns, Line, Column, Length, NoLines, NoColumns),
  countOnes(Lines, FilledLines),
  countOnes(Columns, FilledColumns),
  Filled is FilledLines + FilledColumns,
  Filled = Length.

indexOf([Element|_], Element, 1):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.

countOnes(Matrix, Ones) :-
  countOnes(Matrix, 0, Ones).

countOnes([], Ones, Ones).

countOnes([Head|Tail], Accumulator, Ones) :-
  sumlist(Head, Sum),
  NewAccumulator is Accumulator + Sum,
  countOnes(Tail, NewAccumulator, Ones).

findFirstLine(Lines, Line, Column) :-
  findFirstLine(Lines, 1, Line, Column).

findFirstLine([Head|Tail], ProcLine, Line, Column) :-
  (
    indexOf(Head, 1, Index),
    Line is ProcLine,
    Column is Index
  ;
    NewLine is ProcLine + 1,
    findFirstLine(Tail, NewLine, Line, Column)
  ).

findLoop(Lines, Columns, Line, Column, Length, NoLines, NoColumns) :-
  findLoop(Lines, Columns, Line, Column, [Line-Column], List, NoLines, NoColumns),
  length(List, Length).

finish(Accumulator, Accumulator).

findLoop(Lines, Columns, Line, Column, Accumulator, List, NoLines, NoColumns) :-
  (
    Line = 1
    ;
    OldLine is Line - 1
  ),
  (
    Column = 1
    ;
    OldColumn is Column - 1
  ),
  nth1(Line, Lines, CurrLine),
  (
    Line = NoLines
    ;
    nth1(Line, Columns, Bottom)
  ),
  (
    Line = 1
    ;
    nth1(OldLine, Columns, Top)
  ),
  (
    (
      Column \= NoColumns,
      nth1(Column, CurrLine, RightLine),
      RightLine = 1,
      NewColumn is Column + 1,
      \+member(Line-NewColumn, Accumulator),
      append([Line-NewColumn], Accumulator, NewAccumulator),
      findLoop(Lines, Columns, Line, NewColumn, NewAccumulator, List, NoLines, NoColumns)
      ;
      Column \= 1,
      nth1(OldColumn, CurrLine, LeftLine),
      LeftLine = 1,
      \+member(Line-OldColumn, Accumulator),
      append([Line-OldColumn], Accumulator, NewAccumulator),
      findLoop(Lines, Columns, Line, OldColumn, NewAccumulator, List, NoLines, NoColumns)
      ;
      Line \= NoLines,
      nth1(Column, Bottom, BottomCol),
      BottomCol = 1,
      NewLine is Line + 1,
      \+member(NewLine-Column, Accumulator),
      append([NewLine-Column], Accumulator, NewAccumulator),
      findLoop(Lines, Columns, NewLine, Column, NewAccumulator, List, NoLines, NoColumns)
      ;
      Line \= 1,
      nth1(Column, Top, TopCol),
      TopCol = 1,
      \+member(OldLine-Column, Accumulator),
      append([OldLine-Column], Accumulator, NewAccumulator),
      findLoop(Lines, Columns, OldLine, Column, NewAccumulator, List, NoLines, NoColumns)
    )
  ;
    finish(Accumulator, List)
  ).