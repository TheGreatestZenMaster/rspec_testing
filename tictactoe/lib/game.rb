load 'player.rb'
load 'display.rb'
#The Game of Tic Tac Toe
class Game
	#initializes the game and then starts one
	def initialize()
		puts "Greetings Challengers! Time to test yourselves!"
		player1 = Player.new("Player 1", "O")
		player2 = Player.new("Player 2", "X")
		@display = Display.new
		set_player_turn(player1, player2)
		play_game
	end
	
	#the main game loop
	def play_game
		continue = true
		while continue
			count = 0
			while true
				set_player_turn(@player1, @player2)
				@player1.make_move(@display)
				count += 1
				if @player1.check_for_victory(@display.board)
					puts "#{@player1.name} Wins!"
					break
				elsif count == 9
					puts "Game Over! It was a tie!"
					break
				else
					@player2.make_move(@display)
					count += 1
					if @player2.check_for_victory(@display.board)
						puts "#{@player2.name} Wins!"
						break
					elsif count == 9
						puts "Game Over! It was a tie!"
						break
					end
				end
			end
			puts @player1.display_stats
			puts @player2.display_stats
			new_game = new_game?
			if new_game
				reset_game
			else
				continue = false
			end
		end
	end
	
	def set_player_turn(player1, player2)
		if player1.turn == :first
			@player1 = player1
			@player2 = player2
		else
			@player1 = player2
			@player2 = player1
		end
	end

	#asks the player if they want to continue
	def new_game?
		_response = ""
		until _response == "yes" || _response == "no"
			puts "Would you like to continue? Yes/No"
			_response = gets.chomp.downcase
			_response == "yes"? new_game = true : new_game = false
		end
		new_game
	end
	
	#resets the game
	def reset_game
		puts "The Game has been reset!"
		@display.reset
		switch_turns(@player1, @player2)
	end
	
	def switch_turns(player1, player2)
		player1.turn, player2.turn = player2.turn, player1.turn
	end
end

Game.new()
