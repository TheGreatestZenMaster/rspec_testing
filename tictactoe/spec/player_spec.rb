require 'player'

describe "Player" do
    let(:player) {Player.new("Player1", "X")}
    let(:victory_display) {Hash[:one => "X", :two => 2, :three => 3, :four => "X", :five => 5, :six => 6, :seven => "X", :eight => 8, :nine => 9]}
    let(:alt_display) {Hash[:one => "X", :two => 2, :three => 3, :four => "X", :five => "X", :six => 6, :seven => "O", :eight => 8, :nine => 9]}
    
    context "player has a name and symbol" do
        it { expect(player.name).to eql("Player1") }
        it { expect(player.symbol).to eql("X") }
    end

    context "#check_for_victory" do
        it "returns victory correctly" do
            expect(player.check_for_victory(victory_display)).to eql(true)
            expect(player.check_for_victory(alt_display)).to eql(false)
        end
    end
end