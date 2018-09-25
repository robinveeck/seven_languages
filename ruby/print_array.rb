a = (1..16).to_a
hold = []
a.each do |i|
	hold << i
	if hold.size == 4
		print hold
		hold = []
	end
end
