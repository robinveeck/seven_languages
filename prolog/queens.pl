valid_queen((Row, Col)) :- 
	Range = [1, 2, 3, 4, 5, 6, 7, 8],
	member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :- cols(QueensTail, ColsTail).

diags1([],[]).
diags([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- Diagonal is Col - Row, diags1(QueensTail, DiagonalsTail).

diags2([], []).
diags([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- Diagnoal is Col + Row disags2(QueensTail, DiagonalsTail).
eight_queens(Board) :-
	Board = [(1, _), (2, _), (3, _), (4, _), (5, _), (6, _), (7, _), (8, _)],
	valid_board(Board),
	
	cols(Board, Cols),
	diags1(Board, Diags1),
	diags2(Board, Diags2),
	fd_all_different(Cols),
	fd_all_different(Diags1),
	fd_all_different(Diags1),
