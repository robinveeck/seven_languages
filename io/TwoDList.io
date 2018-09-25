Object TwoDList := Object clone

TwoDList dim := method(x, y, (
	self myList := list()

	for (j, 0, y - 1, 1, (
		self myList append(list())
		for (k, 0, x - 1, 1, (
			(self myList at (j)) append ("") 
		)	
	))) 
))

TwoDList toFile := method(file_name, (
	f := File with(file_name)
	f remove
	f openForUpdating
	
	for (j, 0, self myList size - 1, 1, (
		for (k, 0, (self myList at (j)) size - 1, 1, (
			f write("", (self myList at (j)) at (k), ",")
		))
		f write("\n")
	))
))

TwoDList fromFile := method(file_name, (
	self myList := list()

	f := File with(file_name)
	f openForReading
	f foreachLine(nextLine, (
		myList append(nextLine split(","))
	))
))

TwoDList set := method(x, y, value, ((self myList at(y)) atPut(x, value)))
TwoDList get := method(x, y, (self myList at(y)) at (x))

TwoDList transpose := method(
	newList := list()
	current_y := myList size
	current_x := if (current_y != 0, myList at (0) size, 0)
	
	for (j, 0, current_x - 1, 1, (
		newList append(list())
		for (k, 0, current_y - 1 , 1, (
			newList at (j) append (self get(j,k))
		))
	))

	myList = newList
	return self
)

test := clone TwoDList
test dim(4,4)
test fromFile("my_test_file.txt")
(test transpose) toFile("my_file.txt")
