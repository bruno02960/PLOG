pcMove(CurrPlayer, BoardIn, BoardOut):-
  countBarragoons(BoardIn, BarragooIn),
  countOpponent(BoardIn, OpponentIn),
  findall(XBoard-C-D, A^B^C^D^movePiece(CurrPlayer, BoardIn, A, B, C, D, XBoard), PossiblePlays),
  (
     PossiblePlays \= []
  ;
     changePlayer(CurrPlayer, NewPlayer),
     gamePrint(BoardIn), nl,
     write(NewPlayer), write(' won!'),
     abort
  ),

  choosePlay(PossiblePlays, BarragoonIn, OpponentIn, BoardOut)
.

choosePlay([PossiblePlays|_], BarragoonIn, OpponentIn, BoardOut).
choosePlay([_|PossiblePlays], BarragoonIn, OpponentIn, BoardOut):-
/*
  compara o nr de pecas e o nr de PossiblePlay atual com o inicial, para saber se come ou nao
  precedencia:
  1 - comer pecas
  2 - comer barragoons
  3 - random (?)
*/
.

checkAte(CurrPlayer, BoardIn, NewBoard, Piece):-
/*
  comparar dois tabuleiros; identificar peca que foi comida (ou nao)
*/
.

countBarragoons(BoardIn, Barragoon):-
  countBarraggons(Board, [_| ], Barragoon)
.
countBarragoons([], Barragoon).

countBarragoons([[Head|_]|Lists], [Head|L], Barragoon):-
  countBarragoons(Lists, L, Barragoon).

countBarragoons([[_,Head|Tail]|Lists], L, Barragoon):-
  countBarragoons([[Head|Tail]|Lists], L, Barragoon)



countPieces(BoardIn, Pieces):-
.
