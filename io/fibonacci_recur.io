fib := method(n,
	if (n == 1) then (return 1) elseif(n == 2) then (return 1) else (return fib(n - 2) + fib(n - 1))
)

fib(6) println
