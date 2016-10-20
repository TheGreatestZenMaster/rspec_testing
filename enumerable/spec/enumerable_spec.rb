require "enumerable"

describe "Enumerable" do
    let(:ary) { [1,2,3,4,100] }
    
    describe "#my_count" do
        it "returns a number" do
            expect(ary.my_count).to be_instance_of(Fixnum)
        end
        
        context "when array has elements" do
            it { expect(ary.my_count).to eql(5) }
            it { expect([nil, nil, nil].my_count).to eql(3) }
        end
        
        context "when passed nonenumerable objects" do
            it { expect{nil.my_count}.to raise_error(NoMethodError) }
            it { expect{99.my_count}.to raise_error(NoMethodError) }
            it { expect{"hi".my_count}.to raise_error(NoMethodError) }
        end
        
        context "when passed a block" do
            
            let(:block) {proc {|e| e.even?}}
            
            it "counts only evens" do
                expect(ary.my_count(&block)).to eql(3)
            end
        end
        
    end
    
    describe "#my_select" do
        it "returns an Array" do
            expect(ary.my_select).to be_instance_of(Array)
        end
        it "returns an array matching the block" do
            expect(ary.my_select{|x| x==2}).to eql([2])
        end
        context "non enumerable objects" do
        it { expect{nil.my_select}.to raise_error(NoMethodError) }
        it { expect{99.my_select}.to raise_error(NoMethodError) }
        it { expect{"hi".my_select}.to raise_error(NoMethodError) }
        end
    end
end