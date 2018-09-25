module ActsAsCSV
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')
		
			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		def each
			@csv_contents.each do |row|
				yield CSVRow.new @headers, row
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
	end
end

	
class RubyCSV
	include ActsAsCSV
	acts_as_csv
end

class CSVRow
	attr_accessor :row

	def initialize(headers, values)
		@row = {}
		headers.each_with_index do |field_name, index|
			@row[field_name] = values[index]
		end
	end

	def method_missing name, *args
		@row[name.to_s]
	end

end

m = RubyCSV.new
m.each {|row| puts row.two}
