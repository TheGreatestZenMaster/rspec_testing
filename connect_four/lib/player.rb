class Player
    attr_accessor :name, :symbol, :line_width
    @@count = 0
    
    def initialize(name)
        @name = name
        @@count += 1
        @@count == 1? @symbol = "\u2605": @symbol = "\u26AB"
        @line_width = 50
    end

    def get_choice
        choice = ""
        valid = false
        until valid
            puts "#{@name}:".center(@line_width)
            puts "Please choose a number between 1 and 7!".center(@line_width)
            puts "Enter:'exit' to exit!".center(@line_width)
            choice = $stdin.gets.chomp
            valid = true if (choice.to_i >= 1 && choice.to_i <= 7) || choice.downcase == "exit" 
        end
        choice.to_i == 0? choice: choice.to_i
    end
end

