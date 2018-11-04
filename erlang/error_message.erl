-module(error_message).
-export([result/1]).

result(success) -> io:format("~p~n", ["success"]);
result({error, Message}) -> io:format("~p~n", ["error: " ++  Message]).
