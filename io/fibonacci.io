fib := method(n,
	x := 0
	y := 1
	i := 1
	while(i <= n,
		sum := x + y
		sum println
		x = y
		y = sum
		i = i + 1
	)
)

fib(6)
