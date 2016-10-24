require 'game_board'
require 'player'

describe "GameBoard" do
    let(:player) { Player.new("Jake") }
    let(:game)  { GameBoard.new } 
    let(:game_inplay)  {GameBoard.new}
    let(:board) {   [  [:zero,:zero,:zero,:zero,:zero,:zero,:zero],[:one,:one,:one,:one,:one,:one,:one],[:two,:two,:two,:two,:two,:two,:two],
                    [:three,:three,:three,:three,:three,:three,:three],[:four,:four,:four,:four,:four,:four,:four],[:five,:five,:five,:five,:five,:five,:five]] }
                        
    let(:board_inplay){[["\u2611","\u2611","\u2612",:zero,:zero,:zero,:zero],["\u2612",:one,:one,:one,:one,:one,:one],
                        [:two,:two,:two,:two,:two,:two,:two],["\u2611",:three,:three,:three,:three,:three,:three],
                        ["\u2612",:four,:four,:four,:four,:four,:four],["\u2612","\u2611",:five,:five,:five,:five,:five]] }
    context "intialize" do
        it { expect(game.board).to eql(board) }
    end
    
    context "#drop_piece" do
        before do
            game.drop_piece(4, player)
        end
        it "updates board" do
            expect(game.board[5][3]).to eql(player.symbol)
            expect(game.board[4][1]).to eql(:four)
        end
    end
end