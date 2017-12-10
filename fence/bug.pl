:-use_module(library(lists)).

/*
lines([[a1,a2,a3,a4,a5,a6],[a7,a8,a9,a10,a11,a12],[a13,a14,a15,a16,a17,a18],[a19,a20,a21,a22,a23,a24],[a25,a26,a27,a28,a29,a30],[a31,a32,a33,a34,a35,a36],[a37,a38,a39,a40,a41,a42]]).
columns([[b1,b2,b3,b4,b5,b6,b7], [b8,b9,b10,b11,b12,b13,b14], [b15,b16,b17,b18,b19,b20,b21], [b22,b23,b24,b25,b26,b27,b28], [b29,b30,b31,b32,b33,b34,b35], [b36,b37,b38,b39,b40,b41,b42]]).*/

lines([[a,b],[d,e],[g,h]]).
columns([[i,j,k],[l,m,n]]).

main:-
  lines(X), columns(Y),
  adjacent(X, Y, 1, 1).

matrix(_, 0, 0).

matrix(Matrix, I, 0):-
  I > 0,
  NewI is I-1,
  matrix(Matrix, NewI, 3).

matrix(Matrix, I, J) :-
    nth1(I, Matrix, Row),
    nth1(J, Row, Value),
    write(Value), nl,
    NewJ is J-1,
    matrix(Matrix, I, NewJ).

adjacent(_,_,4,4).

adjacent(Lines, Columns, I, J):-
  Adjacents = [A, B, C, D],
  write('I = '), write(I), nl,
  write('J = '), write(J), nl,
  nth1(I, Lines, Line),
  (
    J < 3,
    nth1(J, Line, RightLine),
    A=RightLine
  ;
    A = 0,
    true
  ),
  (
    J \= 1, OldJ is J-1,
    nth1(OldJ, Line, LeftLine),
    B=LeftLine
    ;
    B = 0,
    true
  ),

  (
    I < 3,
    nth1(I, Columns, Down),
    nth1(J, Down, DownCol),
    C=DownCol
    ;
    C = 0,
    true
  ),
  (
    I \= 1, OldI is I-1,
    nth1(OldI, Columns, Up),
    nth1(J, Up, UpCol),
    D = UpCol
    ;
    D = 0,
    true
  ),

  (
    J < 3,
    NewI is I,
    NewJ is J+1
    ;
    J=3,
    I=3,
    NewJ is 4,
    NewI is 4
    ;
    J=3,
    I\=3,
    NewJ is 1,
    NewI is I+1
  ),
  nl,
  write(Adjacents),
  adjacent(Lines, Columns, NewI, NewJ).
