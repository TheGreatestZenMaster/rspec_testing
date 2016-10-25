class GameBoard
    attr_accessor :board, :display, :slots, :turn
    
    def initialize(first_player)
        @board = [  [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six]]
        @display = display
        @turn = first_player
        build_board
    end
    def build_board
        @slots = Array.new
        (1..7).each do |x|
            (1..6).each { |y| @slots << [x, y]}
        end
    end

    def display
        display = "Connect Four\n"
        code = "\u2610"
        @board.each do |sub_array|
           rowline = "|"
           sub_array.each { |row| row.is_a?(Symbol)? rowline << "#{code.encode('utf-8')}|": rowline << "#{row.encode('utf-8')}|"}
           display << rowline + "\n"
        end
        display.split("\n").each {|line| puts (line.encode('utf-8')).center(50)}
    end
    
    def drop_piece(column)
        5.downto(0) do |row|
            next unless @board[row][column-1].is_a?(Symbol)
            @board[row][column-1] = @turn.symbol
            break
        end
    end
    
    def check_for_victory
        start = Node.new([1,1], 0)
        queue = Array.new
        queue << start
        victory = false
        nodes_visited = Array.new
        until queue.empty? || victory
            current_node = queue.shift
            nodes_visited << current_node.value
            if @board[current_node.value[1]-1][current_node.value[0]-1] == @turn.symbol
                current_node.count += 1
                victory = true if current_node.count == 4
            else
                current_node.count = 0
            end
            current_node.children.each do |child_value|
                next if nodes_visited.include?(child_value)
                child = Node.new(child_value, current_node.count)
                queue << child
            end
        end
        victory
    end
end

class Node
    attr_accessor :value, :children, :count
    def initialize(value, count=0)
        @count = count
        @value = value
        @children = Array.new
        find_children
    end
    
    def find_children
        zero_plus_one = @value[0] + 1
        one_plus_one = @value[1] + 1
        one_minus_one = @value[1] - 1

        if zero_plus_one <= 7
            @children << [zero_plus_one, @value[1]]
            @children << [zero_plus_one, one_plus_one] if one_plus_one <= 6
        end
        @children << [@value[0], one_plus_one] if one_plus_one <= 6
        @children << [zero_plus_one, one_minus_one] if one_minus_one >= 1 && zero_plus_one <= 7
    end
end

