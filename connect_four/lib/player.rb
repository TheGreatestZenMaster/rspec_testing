class Player
    attr_accessor :name, :symbol
    @@count = 0
    
    def initialize(name)
        @name = name
        @@count += 1
        @@count == 1? @symbol = "\u2605": @symbol = "\u26AB"
    end

    def get_choice
        choice = ""
        valid = false
        until valid
            puts "#{@name}, please choose a number between 1 and 7! Or, enter 'exit', to exit!"
            choice = $stdin.gets.chomp
            valid = true if (choice.to_i >= 1 && choice.to_i <= 7) || choice.downcase == "exit" 
        end
        choice.to_i == 0? choice: choice.to_i
    end
end

