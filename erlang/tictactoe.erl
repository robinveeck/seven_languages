-module(tictactoe).
-export([winstate/1]).

winstate([X, X, X, _, _, _, _, _, _]) -> X;
winstate([_, _, _, X, X, X, _, _, _]) -> X;
winstate([_, _, _, _, _, _, X, X, X]) -> X;
winstate([X, _, _, X, _, _, X, _, _]) -> X;
winstate([_, X, _, _, X, _, _, X, _]) -> X;
winstate([_, _, X, _, _, X, _, _, X]) -> X;
winstate([X, _, _, _, X, _, _, _, X]) -> X;
winstate(List) -> 
	case lists:any(fun(Move) -> Move ==  null end, List) of 
		true -> "no_winner";
		false -> "cat"
		end.
