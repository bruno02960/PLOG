:-include('gamePrinting.pl').
:-use_module(library(clpfd)).
:-use_module(library(lists)).

lines([ [L1C1, L1C2, L1C3, L1C4, L1C5, L1C6],
        [L2C1, L2C2, L2C3, L2C4, L2C5, L2C6],
        [L3C1, L3C2, L3C3, L3C4, L3C5, L3C6],
        [L4C1, L4C2, L4C3, L4C4, L4C5, L4C6],
        [L5C1, L5C2, L5C3, L5C4, L5C5, L5C6],
        [L6C1, L6C2, L6C3, L6C4, L6C5, L6C6],
        [L7C1, L7C2, L7C3, L7C4, L7C5, L7C6]  ]).

columns([ [C1L1, C2L1, C3L1, C4L1, C5L1, C6L1, C7L1],
          [C1L2, C2L2, C3L2, C4L2, C5L2, C6L2, C7L2],
          [C1L3, C2L3, C3L3, C4L3, C5L3, C6L3, C7L3],
          [C1L4, C2L4, C3L4, C4L4, C5L4, C6L4, C7L4],
          [C1L5, C2L5, C3L5, C4L5, C5L5, C6L5, C7L5],
          [C1L6, C2L6, C3L6, C4L6, C5L6, C6L6, C7L6] ]).



/* cell(Digit, Line, Column), Top-left line and column */
cell(3,1,1).
cell(2,2,1).
cell(2,3,1).
cell(0,4,1).
cell(1,5,1).
cell(0,6,1).
cell(2,1,2).
cell(2,3,2).
cell(2,4,2).
cell(3,5,2).
cell(2,1,3).
cell(3,4,3).
cell(2,6,3).
cell(3,1,4).
cell(1,3,4).
cell(2,6,4).
cell(2,2,5).
cell(3,3,5).
cell(2,4,5).
cell(1,6,5).
cell(3,1,6).
cell(1,2,6).
cell(3,3,6).
cell(2,4,6).
cell(2,5,6).
cell(2,6,6).

/*cell(0,1,1).
cell(0,1,2).
cell(1,1,4).
cell(1,1,6).
cell(1,2,6).
cell(3,3,1).
cell(1,3,3).
cell(3,4,4).
cell(1,4,6).
cell(3,5,1).
cell(3,6,1).
cell(3,6,3).
cell(1,6,5).
cell(2,6,6).*/

puzzle  :-
  lines(Lines),
  defineDomain(Lines),
  columns(Columns),
  defineDomain(Columns),
  findall([Digit, Line, Column], cell(Digit, Line, Column), Database),
  restringir(Database, Lines, Columns),
  /*restringir1Linha(1, Lines, Columns),
  restringirUltLinha(1, Lines, Columns),
  restringir1Coluna(1, Lines, Columns),
  restringirUltColuna(1, Lines, Columns),*/
/*  restringirMeio(2, 2, Lines, Columns),*/ /* PARA FAZER */
  labelingVars(Lines),
  labelingVars(Columns),
  write('Columns = '), write(Columns), nl,
  write('Lines = '), write(Lines).

defineDomain([]).
defineDomain([Head|Tail]) :-
  domain(Head, 0, 1),
  defineDomain(Tail).

labelingVars([]).
labelingVars([Head|Tail]) :-
  labeling([], Head),
  labelingVars(Tail).

restringirUltColuna(6, _, _).
restringirUltColuna(Linha, Lines, Columns) :-
    nth1(Linha, Lines, TopLine),
    element(6, TopLine, Line),
    nth1(Linha, Columns, Col1),
    element(7, Col1, TopCol),
    NovaLinha is Linha + 1,
    nth1(NovaLinha, Columns, Col2),
    element(7, Col2, BottomCol),
    sum([Line, TopCol, BottomCol], #<, 2),
    restringirUltColuna(NovaLinha, Lines, Columns).

restringir1Coluna(6, _, _).
restringir1Coluna(Linha, Lines, Columns) :-
    nth1(Linha, Lines, TopLine),
    element(1, TopLine, Line),
    nth1(Linha, Columns, Col1),
    element(1, Col1, TopCol),
    NovaLinha is Linha + 1,
    nth1(NovaLinha, Columns, Col2),
    element(1, Col2, BottomCol),
    sum([Line, TopCol, BottomCol], #<, 2),
    restringir1Coluna(NovaLinha, Lines, Columns).

restringir1Linha(6, _, _).
restringir1Linha(Coluna, Lines, Columns) :-
    nth1(Coluna, Columns, Col),
    element(1, Col, Line),
    nth1(Coluna, Lines, Lin1),
    element(1, Lin1, LeftLin),
    NovaColuna is Coluna + 1,
    nth1(NovaColuna, Lines, Lin2),
    element(1, Lin2, RightLin),
    sum([Line, LeftLin, RightLin], #<, 3),
    restringir1Linha(NovaColuna, Lines, Columns).


restringirUltLinha(6, _, _).
restringirUltLinha(Coluna, Lines, Columns) :-
    nth1(Coluna, Columns, Col),
    element(5, Col, Line),
    nth1(Coluna, Lines, Lin1),
    element(6, Lin1, LeftLin),
    NovaColuna is Coluna + 1,
    nth1(NovaColuna, Lines, Lin2),
    element(6, Lin2, RightLin),
    sum([Line, LeftLin, RightLin], #<, 3),
    restringirUltLinha(NovaColuna, Lines, Columns).

restringir([], _, _).
restringir([[Digit, Line, Column] | Tail], Lines, Columns) :-
/* Vai buscar linhas e colunas necessárias para fazer a restrição */
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
    restringir(Tail, Lines, Columns).
