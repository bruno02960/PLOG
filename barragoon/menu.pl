/**
*	Game level selection menu
*/
levelSelection(Level):-
	write('*** SELECT DIFFICULTY ***'), nl,
	write('1. Easier'), nl,
	write('2. Harder'), nl,
	write('Select an option (0 to exit): '),	read(Level).

/**
* Game menu
*/
menu:-
	write('*** BARRAGOON ***'), nl,
	write('1. Human vs Human'), nl,
	write('2. Human vs CPU'), nl,
	write('3. CPU vs CPU'), nl,
	write('Select an option (0 to exit): '),	read(Option),
	menuExe(Option).

/**
*	Executes menu option
*/
menuExe(Option):-
(
  Option=1, playHvsH
  ;
  Option=2, levelSelection(Level), playHvsCPU(Level)
  ;
  Option=3, levelSelection(Level), playCPUvsCPU(2)
  ;
  Option=0, abort
).
