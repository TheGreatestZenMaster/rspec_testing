class Player
	attr_accessor :symbol, :name, :wins, :loses, :turn
	@@victory_conditions = [[:one, :two, :three], [:four, :five, :six], [:seven, :eight, :nine], [:one, :four, :seven],[:two, :five, :eight],[:three, :six, :nine],[:one, :five, :nine],[:seven, :five, :three]].to_a
	
	#initalizes the players
	def initialize(name, symbol)
		@name = name
		@symbol = symbol
		set_turn
		@wins = 0
		@loses = 0
		puts "#{@name} is '#{@symbol}'. #{@name} goes #{@turn}."
	end
	
	#takes a game board: checks for victory condition
	def check_for_victory(display_board)
		victory = false
		@@victory_conditions.each { |sub_array| victory = true if sub_array.all?{|x| display_board[x] == @symbol}}
		@wins += 1 if victory
		victory
	end
	
	def set_turn
		@name == "Player 1"? @turn = :first: @turn = :second
	end

	#shows the stats
	def display_stats
		print "#{@name} has #{@wins} wins!"
	end
	
	#processes the move of the player
	def make_move(display)
		puts "It is your turn #{@name}!"
		display.update(self)
	end
end