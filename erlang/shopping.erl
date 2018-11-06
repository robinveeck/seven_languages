-module(shopping).
-export([get_items/1]).

get_items(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List]. 
