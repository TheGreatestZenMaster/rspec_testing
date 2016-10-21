require 'display'
require 'spec_helper'
require 'stringio'

describe "Display" do
    before do
        $stdin = StringIO.new("3")
    end
    let(:player) {Player.new("Player1", "X")}
    let(:display) {Display.new}
    let(:board) {display.board = [:one => "X", :two => 2, :three => 3, :four => "X", :five => 5, :six => 6, :seven => "X", :eight => 8, :nine => 9]}

    context "#choose" do
        it "converts '3' to sym" do
            expect(display.choose).to eql(:three)
        end
    end
    
    context "#convert_to_num" do
        it { expect(display.convert_to_num("two")).to eql(2) }
        it { expect(display.convert_to_word(2)).to eql("two") }
    end
    
    after do
        $stdin = STDIN
    end
end