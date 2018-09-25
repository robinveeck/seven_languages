file_name = '/Users/robin/seven_languages/ruby/test.txt'
string_to_match = 'match'
line_number = 0;
File.open(file_name, 'r') do |f|
	f.each_line do |line|
		puts "#{line_number}: #{line}" if line.include? string_to_match
		line_number += 1
	end
end
