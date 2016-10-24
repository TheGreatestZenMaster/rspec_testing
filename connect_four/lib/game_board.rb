class GameBoard
    attr_accessor :board, :display, :slots, :turn
    
    def initialize
        @board = [  [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six],
                    [:zero,:one,:two,:three,:four,:five,:six]]
        @display = display
        @turn = nil
        build_board
    end
    def build_board
        @slots = Array.new
        (1..7).each do |x|
            (1..6).each { |y| @slots << [x, y]}
        end
        puts @slots.inspect
    end

    def display
        display = "Connect Four\n"
        @board.each do |sub_array|
           rowline = "|"
           sub_array.each do |row|
               if row.is_a?(Symbol)
                   code = "\u2610"
                   rowline << "#{code.encode('utf-8')}|"
               else
                   rowline << "#{row.encode('utf-8')}|"
               end
           end
           rowline += "\n"
           display << rowline
        end
        display.split("\n").each {|line| puts (line.encode('utf-8')).center(40)}
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
        continue = true
        victory = false
        nodes_visited = Array.new
        while continue
            current_node = queue.shift
            nodes_visited << current_node.value
            if @board[current_node.value[1]-1][current_node.value[0]-1] == @turn.symbol
                current_node.count += 1
                if current_node.count == 4
                victory = true
                continue = false
                end
            else
                current_node.count = 0
            end
            current_node.children.each do |child_value|
                if nodes_visited.include?(child_value)
                    next
                else
                    child = Node.new(child_value, current_node.count)
                    queue << child
                end
            end
            continue = false if queue.empty?
        end
        victory
    end
end

class Node
    attr_accessor :value, :children, :parent, :count
    def initialize(value, count=0)
        @count = count
        @value = value
        @children = Array.new
        find_children
    end
    
    def find_children
        right_diag_edges
        left_diag_edges
        top_edges
        right_edges
    end

    def right_edges
        zero_plus_one = @value[0] + 1

        if zero_plus_one <= 7
            @children << [zero_plus_one, @value[1]]
        end
    end
    
    def right_diag_edges
        zero_plus_one = @value[0] + 1
        one_plus_one = @value[1] + 1

        
        if zero_plus_one <= 7
            if one_plus_one <= 6
                @children << [zero_plus_one, one_plus_one]
            end
        end
    end
    
    def top_edges
        one_plus_one = @value[1] + 1

        if one_plus_one <= 6
            @children << [@value[0], one_plus_one]
        end
    end
    
    def left_diag_edges
        zero_plus_one = @value[0] + 1
        one_minus_one = @value[1] - 1

        
        if one_minus_one >= 1
            if zero_plus_one <= 7
                @children << [zero_plus_one, one_minus_one]
            end
        end
    end
end

