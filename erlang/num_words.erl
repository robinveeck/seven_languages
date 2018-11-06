-module(num_words).
-export([num_chars_in_str/1]).
-export([num_words_in_str/1]).

num_chars_in_str([]) -> 0;
num_chars_in_str([Head | Tail]) -> 1 + num_chars_in_str(Tail).

num_words_in_str([]) -> 0;
num_words_in_str(String) -> [Head | Tail] = string:split(String, " "), 1 + num_words_in_str(Tail).
