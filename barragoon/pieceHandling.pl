/* Vai buscar a peça que ocupa uma posição do tabuleiro de jogo */
getPiece(Board, Nline, Ncolumnumn, Piece) :-
	getElePos(Nline, Board, Line),
	getElePos(Ncolumnumn, Line, Piece).

getElePos(1, [Element|_], Element).

getElePos(Pos, [_|Rest], Element) :-
	Pos > 1,
	Next is Pos-1,
	getElePos(Next, Rest, Element).
/* ------------------------------------------*/

/* Coloca uma peça no tabuleiro de jogo */
setPiece(InBoard, Nline, Ncolumn, Piece, OutBoard) :-
	setNaLine(Nline, InBoard, Ncolumn, Piece, OutBoard).

setNaLine(1, [Line|Rest], Ncolumn, Piece, [NewLine|Rest]):-
	setNaColuna(Ncolumn, Line, Piece, NewLine).

setNaLine(Pos, [Line|Rest], Ncolumn, Piece, [Line|NewLine]):-
	Pos > 1,
	Next is Pos-1,
	setNaLine(Next, Rest, Ncolumn, Piece, NewLine).

setNaColuna(1, [_|Rest], Piece, [Piece|Rest]).

setNaColuna(Pos, [X|Rest], Piece, [X|NewRest]):-
	Pos > 1,
	Next is Pos-1,
	setNaColuna(Next, Rest, Piece, NewRest).
/* ------------------------------------------*/