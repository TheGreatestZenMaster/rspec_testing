require 'connect_four'
require 'player'

describe "ConnectFour" do
    let(:game) {Connect_Four.new}
    context "#switch_turns" do
        it {expect(game.switch_turns).to eq(game.player2)}
    end
end