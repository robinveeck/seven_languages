OperatorTable addAssignOperator(":", "evalDict")

Builder := Object clone
Builder level := 0

Builder evalDict := method(
	new_sequence := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
	new_sequence appendSeq("=")
	new_sequence appendSeq(call evalArgAt(1))
)

curlyBrackets := method(input,
	seq := ""
	call message arguments foreach(arg,
		seq := seq asMutable appendSeq(" ", doMessage (arg))
	)
	seq
)

Builder forward := method(

	for (i, 0, level -1, 1, write("  "))
	message_args := call message arguments
	if (message_args size != 0) then (
		first_arg_name := message_args at(0) name
	) else (
		first_arg_name := nil
	)
	if (first_arg_name == "curlyBrackets") then (
		writeln("<", call message name, self doMessage(message_args at(0)), ">")
		message_args sliceInPlace(1) 
	) else (
		writeln("<", call message name, ">")	
	)
	level = level + 1

	message_args foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence") then (
			for (i, 0, level, 1, write("  "))
			writeln(content)
		))
	level = level - 1
	for (i, 0, level -1, 1, write("  "))
	writeln("</", call message name, ">")	
)

doFile("test_script.io")
