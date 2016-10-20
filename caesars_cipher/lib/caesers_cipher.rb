def caeser_cipher(string, shift)
	caps = ("A".."Z").to_a
	lowers = ("a".."z").to_a
	new_str = string.gsub(/./) do |x| 
		if caps.include?(x)
			x = ((caps.index(x) + shift) >= caps.size)? caps[caps.index(x) + shift - caps.size] : caps[caps.index(x) + shift]
		elsif lowers.include?(x)
            x = ((lowers.index(x) + shift) >= lowers.size)? lowers[lowers.index(x) + shift - lowers.size]: lowers[lowers.index(x) + shift]
		end
	end
	new_str
end


puts "Please input a string to cipher!"
str = gets.chomp
puts "Please enter an integer to shift by!"
shift = gets.chomp.to_i
puts "Caeser Cipher: \n#{caeser_cipher(str, shift)}"