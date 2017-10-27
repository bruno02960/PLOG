getPeca(Tabuleiro, Nlinha, NCol, Peca) :-
	getElePos(NLinha, Tabuleiro, Linha),
	getElePos(NCol, Linha, Peca).

/* nLinha e nCol s�o decrementados a cada chamada. */

getElePos(1, [Elemento|_], Elemento).

getElePos(Pos, [_|Resto], Elemento) :-
	Pos > 1,
	Next is Pos-1,
	getElePos(Next, Resto, Elemento).

--------------------------------------------------------------

setPeca(TabIn, NLinha, NCol, Peca, TabOut) :-
	setNaLinha(NLinha, TabIn, NCol, Peca, TabOut).

setNaLinha(1, [Linha|Resto], NCol, Peca, [NovaLinha|Resto]):-
	setNaColuna(NCol, Linha, Peca, NovaLinha).

setNaLinha(Pos, [Linha|Resto], NCol, Peca, [Linha|NovoResto]):-
	Pos > 1,
	Next is Pos-1,
	setNaLinha(Next, Resto, NCol, Peca, NovaLinha).

setNaColuna(1, [_|Resto], Peca, [Peca|Resto]).

setNaColuna(Pos, [X|Resto], Peca, [X|NovoResto]):-
	Pos > 1,
	Next is Pos-1,
	setNaColuna(Next, Resto Peca, NovoResto).


--------------------------------------------------------------
/* Usar biblioteca de listas */
:-use_module(library(listas)).

- nth1?
- nth1(2,[a,b,c],X).
	X=b
- nth0(2,[a,b,c],X).
	X=c

---------------------------------------------------------------
printBoard(Board) :-
	printBlackLine,
	printRowByRow(Board),
	printBlackLine.

printBlackLine :-
	write('---------------------'),
	nl.

printRowByRow([]).
printRowByRow([Line|Rest]) :-
	printSingleRow(Line),
	printRowByRow(Rest).

printSingleRow([Cell]):-
	write(Cell),
	write('|'),
	printBlackLine).

printSingleRow([Cell|More]):-
	write(Cell),
	write('|'),
	printSingleRow(More).

-------------------------------------------------------------------
joga:-
  tabuleiroInicial(Tab),
  jogaCiclo(Tab, TabFinal),
  mostraResultado(TabFinal).

jogaCiclo(Tab, Tab):-
  posicaoFinal(Tab).

jogaCiclo(TabIn, TabOut):-
    jogadasPossiveis(TabIn, ListaJogadas),
    escolheMelhor(ListaJogadas, MelhorJogada),
    aplicaJogada(TabIn, MelhorJogada, NewTab),
    jogaCiclo(NewTab, TabOut).


/* ---------------------------------------------------- */

joga:-
      tabuleiroInicial(TabIn),
      assert(tabuleiro(TabIn)),             //guarda na base de dados interna do Prolog
      repeat,
        retract(tabuleiro(TabActual)),      //vai buscar a base de dados
        once(fazJogada(TabActual, NovoTab)),
        assert(tabuleiro(NovoTab)),
        gameOver,
      mostraResultado.

/* ------------------------------------------------------ */

leNumero(Numero):-
  get_char(ch),
  leChars(ch, Lista),
  name(Numero, Lista).                      //http://www.swi-prolog.org/pldoc/doc_for?object=name/2

leChars(10, []).                            //line feed
leChars(13, []).                            //carriage return
leChars(ch,[ch|Mais]):-
  set_char(NewCh),
  leChars(NewChar,Mais).
/* -------------------------------------------------------- */

le(Frase):-
  get_char(ch),                             /* ALTs: get0(ch) or get_code(ch) */
  leTodosOsChars(ch,ListaCaracteres),
  name(Frase,[ch|ListaCaracteres]).

leTodosOsChars(10,[]).
leTodosOsChars(13,[]).
leTodosOsChars(ch,[ch|MaisChars]):-
  get_char(NovoCh),
  leTodosOsChars(NovoCh,MaisChars).

leInteiro(Prompt,Inteiro):-
  repeat,
      write(Prompt),
      le(Inteiro),                          /* once? */
      number(Inteiro).

joga:-
  estados(Jogadas, TabInicial),
  jogaJogo(Jogador, TabInicial, TabFinal),
  mostraResultado(TabFinal).

jogaJogo(Jogador, Tab, Tab):-
  endGame(Jogador, Tab).

jogaJogo(Jogador, Tab, TabFinal):-
  jogadasLegais(Jogador, Tab, Lista Jogadas),   /* Passa a pedeJogada(Jogador, Tab, Jogada) caso jogador humano */
  melhorJogada(Jogador, ListaJogadas, Melhor),  /* Deixa de existir caso jogador humano */
  aplicaJogada(Tab, Melhor, NovoTab),
  proximoJogador(Jogador, Proximo),
  jogaJogo(Proximo, NovoTab, TabFinal).

/* ------------------------------------------------ */

joga:-
  estado(Jogador1, TabInicial),
  assert(estado(Jogador1, TabInicial)),
  repeat,
    retract(estadoJogo(Jogador, Tab)),
    once(jogaJogo(Jogador,Tab,NovoJogador,NovoTab)),
    endOfGame(NovoJogador, NovoTab),
    mostraResultado(NovoJogador, NovoTab).
