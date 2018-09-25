addnums := method(twod_array,
	total_sum := 0
	for (i, 0, (twod_array size) - 1, 1, (
		(twod_array at (i)) println
		total_sum = total_sum +  (twod_array at(i)) sum
	))
	total_sum println
)

addnums(list(list(1, 3), list(2)))
