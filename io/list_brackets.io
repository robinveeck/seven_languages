curlyBrackets := method(
	r := list()
	call message arguments foreach(arg,
		r append(arg)
		)
	self = r
)

test := clone List
ok := {1,2,3,4} println
