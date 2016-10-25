class GameBoard
    attr_accessor :board, :display, :slots, :turn, :victories
    
    def initialize(first_player)
        @victories = [  [[0,0],[0,1],[0,2],[0,3]],[[0,1],[0,2],[0,3],[0,4]],[[0,2],[0,3],[0,4],[0,5]],
                        [[1,0],[1,1],[1,2],[1,3]],[[1,1],[1,2],[1,3],[1,4]],[[1,2],[1,3],[1,4],[1,5]],
                        [[2,0],[2,1],[2,2],[2,3]],[[2,1],[2,2],[0,3],[2,4]],[[2,2],[2,3],[2,4],[0,5]],
                        [[3,0],[3,1],[3,2],[3,3]],[[3,1],[3,2],[3,3],[3,4]],[[3,2],[3,3],[3,4],[3,5]],
                        [[4,0],[4,1],[4,2],[4,3]],[[4,1],[4,2],[4,3],[4,4]],[[4,2],[4,3],[4,4],[4,5]],
                        [[5,0],[5,1],[5,2],[5,3]],[[5,1],[5,2],[5,3],[5,4]],[[5,2],[5,3],[5,4],[5,5]],
                        [[6,0],[6,1],[6,2],[6,3]],[[6,1],[6,2],[6,3],[6,4]],[[6,2],[6,3],[6,4],[6,5]],
                        [[0,0],[1,0],[2,0],[3,0]],[[1,0],[2,0],[3,0],[4,0]],[[2,0],[3,0],[4,0],[5,0]],[[3,0],[4,0],[5,0],[6,0]],
                        [[0,1],[1,1],[2,1],[3,1]],[[1,1],[2,1],[3,1],[4,1]],[[2,1],[3,1],[4,1],[5,1]],[[3,1],[4,1],[5,1],[6,1]],
                        [[0,2],[1,2],[2,2],[3,2]],[[1,2],[2,2],[3,2],[4,2]],[[2,2],[3,2],[4,2],[5,2]],[[3,2],[4,2],[5,2],[6,2]],
                        [[0,3],[1,3],[2,3],[3,3]],[[1,3],[2,3],[3,3],[4,3]],[[2,3],[3,3],[4,3],[5,3]],[[3,3],[4,3],[5,3],[6,3]],
                        [[0,4],[1,4],[2,4],[3,4]],[[1,4],[2,4],[3,4],[4,4]],[[2,4],[3,4],[4,4],[5,4]],[[3,4],[4,4],[5,4],[6,4]],
                        [[0,5],[1,5],[2,5],[3,5]],[[1,5],[2,5],[3,5],[4,5]],[[2,5],[3,5],[4,5],[5,5]],[[3,5],[4,5],[5,5],[6,5]],
                        [[0,2],[1,3],[2,4],[3,5]],[[0,1],[1,2],[2,3],[3,4]],[[1,2],[2,3],[3,4],[4,5]],
                        [[0,0],[1,1],[2,2],[3,3]],[[1,1],[2,2],[3,3],[4,4]],[[2,2],[3,3],[4,4],[5,5]],
                        [[1,0],[2,1],[3,2],[4,3]],[[2,1],[3,2],[4,3],[5,4]],[[3,2],[4,3],[5,4],[6,5]],
                        [[2,0],[3,1],[4,2],[5,3]],[[3,1],[4,2],[5,3],[6,4]],
                        [[3,0],[4,1],[5,2],[6,3]],
                        [[6,2],[5,3],[4,4],[3,5]],
                        [[6,1],[5,2],[4,3],[3,4]],[[5,2],[4,3],[3,4],[2,5]],
                        [[6,0],[5,1],[4,2],[3,3]],[[5,1],[4,2],[3,3],[2,4]],[[4,2],[3,3],[2,4],[1,5]],
                        [[5,0],[4,1],[3,2],[2,3]],[[4,1],[3,2],[2,3],[1,4]],[[3,2],[2,3],[1,4],[0,5]],
                        [[4,0],[3,1],[2,2],[1,3]],[[3,1],[2,2],[1,3],[0,4]],
                        [[3,0],[2,1],[1,2],[0,3]]].to_a
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
    
    def check_for_victory(player)
        victory = false
        victories.each do |sub_array|
            count = 0
            sub_array.each do |pos|
                if @board[pos[1]][pos[0]] == player.symbol 
                    count += 1
                end
                victory = true if count == 4
            end
            next if victory == true
        end
        victory
    end
end
       
=begin
    def check_for_victory(player)
        start = Node.new([1,1], 0)
        queue = Array.new
        queue << start
        victory = false
        nodes_visited = Array.new
        until queue.empty? || victory
            current_node = queue.shift
            nodes_visited << current_node.value
            if @board[current_node.value[1]-1][current_node.value[0]-1] == player.symbol
                next if 
                current_node.count += 1
                victory = true if current_node.count == 4
            else
                current_node.count = 0
            end
            current_node.children.each do |child_value|
                next if 
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
 
    def find_children
        zero_plus_one = @value[0] + 1
        one_plus_one = @value[1] + 1
        one_minus_one = @value[1] - 1
        

        if zero_plus_one <= 7
            #right edge
            @children << [zero_plus_one, @value[1]]
            #right diag
            @children << [zero_plus_one, one_plus_one] if one_plus_one <= 6
            #left diag
            @children << [@value[0], one_minus_one] if one_minus_one >= 1
        end
        #vert
        @children << [@value[0], one_plus_one] if one_plus_one <= 6
        
    end
end

=end


                            

     
