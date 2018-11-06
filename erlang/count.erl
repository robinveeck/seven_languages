-module(count).
-export([count_to_ten/0]).

count_to_ten() -> count_num(1).

count_num(10) -> io:format("~p~n", [10]);
count_num(N) -> io:format("~p~n", [N]), count_num(N+1).
