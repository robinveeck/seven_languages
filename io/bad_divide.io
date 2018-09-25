divide := Number getSlot("/")
Number / := method(n, if(n == 0, 0, self divide(n)))

(5 / 2) println
(5 / 0) println
