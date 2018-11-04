-module(keyvalue).
-export([getval/2]).

getval(List, X) -> [Head | _] = [Value || {Key, Value} <- List, Key == X], Head.
