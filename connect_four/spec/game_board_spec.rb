require 'game_board'

describe "GameBoard" do
    let(:game)  { GameBoard.new } 
    let(:game_inplay)  {GameBoard.new}
    let(:board) {[[:zero,:one,:two,:thre,:four,:five],[:zero,:one,:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five],[:zero,:one,:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five],[:zero,:one,:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five]] }
                        
    let(:board_inplay) {[["O","O","X",:thre,:four,:five],["X",:one,:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five],["O",:one,:two,:thre,:four,:five],
                        ["X",:one,:two,:thre,:four,:five],["X","O",:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five]] }

    context "intialize" do
        it { expect(game.board).to eql(board) }
    end
    
    context "#drop_piece" do
        it { expect(game.drop_piece(4)).to eql(board[4][0]) }
        before do
            game_inplay.board = board_inplay
        end
        it { expect(game_inplay.drop_piece(4)).to eql(board_inplay[4][1]) }
        it "works as an instance double test" do
            test_game = instance_double("GameBoard", :board => [["O","O","X",:thre,:four,:five],["X",:one,:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five],["O",:one,:two,:thre,:four,:five],
                        ["X",:one,:two,:thre,:four,:five],["X","O",:two,:thre,:four,:five],
                        [:zero,:one,:two,:thre,:four,:five]])
            expect(test_game.board).to eql(board_inplay)
        end
    end
    
    context "updates board" do
        before do
            game.update(4, "X")
        end
        it "updates board" do
            expect(game.board[4][0]).to eql("X")
            expect(game.board[4][1]).to eql(:one)
        end
    end
end