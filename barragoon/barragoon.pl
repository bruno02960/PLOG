:-include('gamePrint.pl').

currentBoard([	['    ', ' 4W ', ' 3W ', '    ', ' 3W ', ' 4W ', '    '],
 				['    ', '    ', ' 2W ', ' 3W ', ' 2W ', '    ', '    '],
				['    ', '    ', '    ', '    ', '    ', '    ', '    '],
				['    ', ' No ', '    ', '    ', '    ', ' No ', '    '],
				[' No ', '    ', ' No ', '    ', ' No ', '    ', ' No ' ],
				['    ', ' No ', '    ', '    ', '    ', ' No ', '    '],
				['    ', '    ', '    ', '    ', '    ', '    ', '    '],
				['    ', '    ', ' 2B ', ' 3B ', ' 2B ', '    ', '    '],
				['    ', ' 4B ', ' 3B ', '    ', ' 3B ', ' 4B ', '    ']]).

currentAside('24').

barragoon :- currentBoard(Board), gamePrint(Board), nl, currentAside(Aside), printAside(Aside).