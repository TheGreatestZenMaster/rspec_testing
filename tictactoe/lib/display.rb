class Display
	attr_accessor :board
	#initializes the game board hash
	def initialize
		@linewidth = 45
		@board = Hash[:one => 1, :two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9]
		puts ""
		puts "Let's begin".center(@linewidth)
		puts self.display
	end
	
	#Simple display method that shows the board
	def display
		breakline = "---- --- ----"
		puts breakline.center(@linewidth)
		puts "| #{@board[:one]} | #{@board[:two]} | #{@board[:three]} |".center(@linewidth)
		puts breakline.center(@linewidth)
		puts "| #{@board[:four]} | #{@board[:five]} | #{@board[:six]} |".center(@linewidth)
		puts breakline.center(@linewidth)
		puts "| #{@board[:seven]} | #{@board[:eight]} | #{@board[:nine]} |".center(@linewidth)
		puts breakline.center(@linewidth)
		puts "".center(@linewidth)
	end
	
	#updates the hash that stores the values for the board
	def update(player)
		puts "#{player.name} made their move!"
		location = choose
		@board[location] = player.symbol
		self.display
	end
	
	#resets the board to its original state after a game
	def reset
		@board = Hash[:one => 1, :two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9]
		self.display
	end
	
	#gets input and makes sure it is valid
	def choose
		print "Please choose a number!"
		num = $stdin.gets.chomp
		valid = false
		until valid
			if num.match(/\d+/)
				num = convert_to_word(num.to_i).to_sym
			else
				num = num.downcase.to_sym
			end
			available = (@board[num] != "X" && @board[num] != "O")
			if (@board.keys.include? num) && available
				valid = true
			else
				puts "Sorry that is an illegal move!"
				print "Please choose a number! "
				num = gets.chomp
			end
		end
		num.to_sym
	end
	
	def convert_to_num(num)
		num.downcase!
		case num
		when "one" then 1
		when "two" then 2
		when "three" then 3
		when "four" then 4
		when "five" then 5
		when "six" then 6
		when "seven" then 7
		when "eight" then 8
		when "nine" then 9
		end
	end
	
	def convert_to_word(num)
		case num
		when 1 then x = "one"
		when 2 then x = "two"
		when 3 then x ="three"
		when 4 then x ="four"
		when 5 then x ="five"
		when 6 then x ="six"
		when 7 then x = "seven"
		when 8 then x = "eight"
		when 9 then x ="nine"
		else
			x = "zero"
		end
		x
	end
end
