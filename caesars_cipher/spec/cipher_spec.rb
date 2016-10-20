require "caesars_cipher"

describe ".caesar_cipher" do
    context "Preserves capitalization" do
        it { expect(caesars_cipher("Hello", 1)).to eql("Ifmmp") }
    end
    context "preserves spaces" do
        it {  expect(caesars_cipher("hello dog cat mouse", 1)).to eql("ifmmp eph dbu npvtf") } 
    end
    context "Preserves punctuations" do
        it {  expect(caesars_cipher("Hello. I'm Jake!", 1)).to eql("Ifmmp. J'n Kblf!") } 
    end
    context "reverts to A/a when going past Z/z" do
        it { expect(caesars_cipher("z Z", 1)).to eql("a A") }
    end
    context "shifts by a big key" do
        it { expect(caesars_cipher("hello", 260)).to eql("hello") }
    end
end
