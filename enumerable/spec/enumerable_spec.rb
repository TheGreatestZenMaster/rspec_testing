require "enumerable"

describe "Enumerable" do
    let(:ary) { [1,2,3,4,100] }
    
    describe "#my_count" do
        it "returns a number" do
            expect(ary.my_count).to be_instance_of(Fixnum)
        end
        it "returns 5" do
            expect(ary.my_count).to eql(5)
        end
        context "non enumerable objects" do
        it { expect{nil.my_count}.to raise_error(NoMethodError) }
        it { expect{99.my_count}.to raise_error(NoMethodError) }
        it { expect{"hi".my_count}.to raise_error(NoMethodError) }
        end
    end
end