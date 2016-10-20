def caesars_cipher(string, shift)
	caps = ("A".."Z").to_a
	lowers = ("a".."z").to_a
	shift = shift%26 if shift >= 26
	new_str = string.gsub(/./) do |x| 
		if caps.include?(x)
		    shift_value = caps.index(x) + shift
			x = (shift_value >= 26)? caps[shift_value - 26] : caps[shift_value]
		elsif lowers.include?(x)
		    shift_value = lowers.index(x) + shift
            x = (shift_value >= 26)? lowers[shift_value - 26]: lowers[shift_value]
		else
		    x = x
		end
	end
	new_str
end

=begin
puts "Please input a string to cipher!"
str = gets.chomp
puts "Please enter an integer to shift by!"
shift = gets.chomp.to_i
puts "Caesar's Cipher: \n#{caesars_cipher(str, shift)}"
=end