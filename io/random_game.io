num := Random value(100) floor
num println

for(i, 0, 10, 1, (
	guess := File standardInput readLine
	if (guess asNumber > num) then ("too high" println) elseif (guess asNumber < num) then ("too low" println) else(
		"you got it" println
		break
	)
))
