require 'game'

describe Game do
    let(:game) {Game.new}
    let(:player1) {Player.new("Player1", "X")}
    let(:player2) {Player.new("Player2", "X")}
    
    context "#switch_turns" do
        before {game.switch_turns(player1, player2) }
        it { expect(player1.turn).to eql(:second) }
    end
end