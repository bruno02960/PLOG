:-include('gamePrint.pl').

initialBoardState([
	['     ','  4  ','  3  ','     ','  3  ','  4  ','     '],
	['     ','     ','  2  ','  3  ','  2  ','     ','     '],
	['     ','     ','     ','     ','     ','     ','     '],
	['     ',  '  N  '  ,'     ','     ','     ','  N  ','     '],
	['  N  ','     ','  N  ','     ','  N  ','     ','  N  '],
	['     ','  N  ','     ','     ','     ','  N  ','     '],
	['     ','     ','     ','     ','     ','     ','     '],
	['     ','     ','  2  ','  3  ','  2  ','     ','     '],
	['     ','  4  ','  3  ','     ','  3  ','  4  ','     ']]).

initialAsideState([
	['  N  ','  N  ','  N  ','   N  ','  N  ','  N  ','  N  ', '  N  ','  N  ','  N  ','  N  ','  N  '],
	['  N  ','  N  ','  N  ','   N  ','  N  ','  N  ','  N  ', '  N  ','  N  ','  N  ','  N  ','  N  ']]).

barragoon :- initialBoardState(Board), printBoard(Board, board), nl, initialAsideState(Aside), printBoard(Aside, aside).