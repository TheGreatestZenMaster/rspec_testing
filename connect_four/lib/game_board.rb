
class GameBoard
    attr_accessor :board
    
    def initialize
        @board = [[:zero,:one,:two,:thre,:four,:five],[:zero,:one,:two,:thre,:four,:five],
                    [:zero,:one,:two,:thre,:four,:five],[:zero,:one,:two,:thre,:four,:five],
                    [:zero,:one,:two,:thre,:four,:five],[:zero,:one,:two,:thre,:four,:five],
                    [:zero,:one,:two,:thre,:four,:five]]
    end
    
    def drop_piece(column)
        @board[column].each do |row|
            next unless row.is_a?(Symbol)
            return row
        end
    end
    
    def update(column, value)
        6.times do |row|
            next unless @board[column][row].is_a?(Symbol)
            @board[column][row] = value
            break
        end
    end
end