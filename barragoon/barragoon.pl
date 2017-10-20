:-include('gamePrint.pl').

currentBoard([	['  ','4W','3W','  ','3W','4W','  '],
								['  ','  ','2W','3W','2W','  ','  '],
								['  ','  ','  ','  ','  ','  ','  '],
								['  ','No','  ','  ','  ','No','  '],
								['No','  ','No','  ','No','  ','No'],
								['  ','No','  ','  ','  ','No','  '],
								['  ','  ','  ','  ','  ','  ','  '],
								['  ','  ','2B','3B','2B','  ','  '],
								['  ','4B','3B','  ','3B','4B','  ']]).

currentAside('24').

getPiece(Board, Nline, Ncolumn, Piece) :-
	getElePos(Nline, Board, Line),
	getElePos(Ncolumn, Line, Piece).

/* nLinha e nCol são decrementados a cada chamada. */

getElePos(1, [Element|_], Element).

getElePos(Pos, [_|Rest], Element) :-
	Pos > 1,
	Next is Pos-1,
	getElePos(Next, Rest, Element).

barragoon:-currentBoard(Board),gamePrint(Board),nl,currentAside(Aside),printAside(Aside).
