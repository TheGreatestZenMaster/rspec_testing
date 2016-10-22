require 'player'

describe "Player" do
    let(:player) { Player.new("Jake") }
    
    context "initialize" do
        it { expect(player.name).to eql("Jake")}
    end
end