load "game_board.rb"
load "player.rb"

class Connect_Four
    attr_accessor :player, :player2, :board, :turn
    def initialize
        @player1 = Player.new("Jake")
        @turn = @player1
        @player2 = Player.new("Bob")
        @board = GameBoard.new(@player)
        play
    end 
    
    def play
        continue = true
        while continue
            @board.turn = @turn
            move = @turn.get_choice
            if move == "exit"
                puts "Thanks for playing! See you next time!"
                continue = false
            else
                while @board.drop_piece(move)
                    puts "That row is full!"
                    move = @turn.get_choice
                end
                @board.display
                if @board.check_for_victory(@turn)
                    puts "Congrats #{@turn.name}! You won!"
                    continue = false
                else
                    switch_turns
                end
            end
        end
    end
    
    def switch_turns
        @turn == @player1? @turn = @player2: @turn = @player1
    end
end

game = Connect_Four.new
