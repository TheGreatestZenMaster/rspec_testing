require 'player'

describe "Player" do
    let(:player1) { Player.new("Jake") }
    let(:player2) { Player.new("Bob") }
    before do
        $stdin = StringIO.new("4")
    end
    context "initialize" do
        it { expect(player1.name).to eql("Jake")}
    end
    
    context "#get_choice" do
       it { expect(player1.get_choice).to eq(4) }
    end
end