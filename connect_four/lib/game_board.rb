
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
end