module Enumerable
	
	def my_each
		for x in self
			yield(x)
		end
		self
	end
  	

	def my_each_with_index
		for x in 0...self.length do
			yield(x, self[x])
		end
		self
	end
	
	def my_select
		result = []
		if block_given?
			self.my_each {|x| result << x if yield(x) == true}
		end
		result
	end

	def my_any?
		result = false
		self.my_each {|x| result = true if yield(x)}
		result
	end

	def my_all?
		result = true
		self.my_each do |x|
			if yield(x)
				next
			else
				result = false
			end
		end
		return result
	end

	def my_none?
		result = true
		self.my_each do |x|
			if yield(x)
				result = false
			end
		end
		return result
	end

	def my_count
		count = 0
		self.my_each { |x| block_given?? (count += 1 if yield(x)): count += 1}
		count
	end

	def my_map(&block)
		result = []
		self.my_each do |x| 
			result << block.call(x)
		end
		return result
	end

	def my_inject(value)
		result = 0
		self.my_each do |x|
			result += yield(value, x)
		end
		return result
	end
end
=begin
my_array = [1,2,3,4,100]
code = Proc.new{|x| x*= 2}


my_array.my_each { |x| puts "My_each returns #{x}"}
my_array.my_each_with_index { |x, y| puts "My_each returns and index of #{x} and a value of #{y}"}
puts "My_select returns #{my_array.my_select{|x| x > 100}}"
puts "My_any? returns #{my_array.my_any?{|x| x > 100}}"
puts  "My_all? returns #{my_array.my_all?{|x| x > 100}}"
puts "My_none? returns #{my_array.my_none?{|x| x > 100}}"
puts "My_count returns #{my_array.my_count}"
puts "My_map returns #{my_array.my_map{|x| x *= 2}}"
puts "My_maps take a proc and returns #{my_array.my_map(&code)}"
puts "My_inject returns #{my_array.my_inject(0){|x, y| x + y}}"
=end