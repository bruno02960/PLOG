:-include('gamePrint.pl').

currentBoard([
	['     ','  4  ','  3  ','     ','  3  ','  4  ','     '],
	['     ','     ','  2  ','  3  ','  2  ','     ','     '],
	['     ','     ','     ','     ','     ','     ','     '],
	['     ','  N  ','     ','     ','     ','  N  ','     '],
	['  N  ','     ','  N  ','     ','  N  ','     ','  N  '],
	['     ','  N  ','     ','     ','     ','  N  ','     '],
	['     ','     ','     ','     ','     ','     ','     '],
	['     ','     ','  2  ','  3  ','  2  ','     ','     '],
	['     ','  4  ','  3  ','     ','  3  ','  4  ','     ']]).

currentAside([
	['  N  ','  N  ','  N  ','   N  ','  N  ','  N  ','  N  ', '  N  ','  N  ','  N  ','  N  ','  N  '],
	['  N  ','  N  ','  N  ','   N  ','  N  ','  N  ','  N  ', '  N  ','  N  ','  N  ','  N  ','  N  ']]).

barragoon :- currentBoard(Board), gamePrint(Board, board), nl, currentAside(Aside), gamePrint(Aside, aside).