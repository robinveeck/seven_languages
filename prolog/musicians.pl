plays_instrument(bob_dylan, guitar).
plays_instrument(bob_dylan, harmonica).
plays_instrument(jack_white, guitar).
plays_instrument(jack_white, piano).

instrument_genre(harmonica, folk).
instrument_genre(guitar, rock).

musician_genre(X, Y) :- plays_instrument(X, Z), instrument_genre(Z, Y).
