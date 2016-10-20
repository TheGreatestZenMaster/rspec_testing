require "caesers_cipher"

describe ".caeser_cipher" do
    context "respsonds to chiper" do
        it { expect(caeser_cipher("", 0)).to eql("") }
    end
end
