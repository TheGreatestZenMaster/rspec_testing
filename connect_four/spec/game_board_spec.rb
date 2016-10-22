require 'game_board'

describe "GameBoard" do
    let(:game)  { GameBoard.new } 
    let(:board) { [ [:one,:two,:thre,:four,:five,:six],[:one,:two,:thre,:four,:five,:six],
                    [:one,:two,:thre,:four,:five,:six],[:one,:two,:thre,:four,:five,:six],
                    [:one,:two,:thre,:four,:five,:six],[:one,:two,:thre,:four,:five,:six],
                    [:one,:two,:thre,:four,:five,:six]] }
    context "intialize" do
        it { expect(game.board).to eql(board) }
    end
end