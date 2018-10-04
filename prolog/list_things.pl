reverse_el([], []).
reverse_el([Head], [Head|[]]).
reverse_el(Reverse, [Head|Tail]) :- reverse_el(Subreverse, Tail), append(Subreverse, [Head], Reverse).

smallest(A, B, Smallest) :- (Smallest = A; Smallest = B), Smallest @=< A, Smallest @=< B.

smallest_el(Head, [Head|[]]).
smallest_el(Smallest, [Head|Tail]) :- smallest_el(Smallest2, Tail), (Smallest = Head; Smallest = Smallest2),  Smallest @=< Head, Smallest @=< Smallest2.

is_sorted([A]).
is_sorted([Head|Tail]) :- smallest_el(Head, [Head|Tail]), is_sorted(Tail).
sorted_list(Sorted, List) :- permutation(List, Sorted), is_sorted(Sorted). 
