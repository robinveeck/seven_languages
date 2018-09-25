List myAverage := method(
	for(i, 0, self size - 1, 1, (
		if ((self at (i)) type != "Number") then (Exception raise ("not a num!"))
	))
	if (self size == 0) then (return nil)
	(self sum) / (self size)

)

list() myAverage println
list(2, 2, 2) myAverage println
list(1, "4", 1) myAverage println
