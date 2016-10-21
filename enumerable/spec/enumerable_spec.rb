require "enumerable"

describe "Enumerable" do
    let(:ary) { [1,2,3,4,100] }
    let(:block) {proc {|e| e.even?}}
    let(:trueblock) {proc {|x| x == true} }
    
    describe "#my_count" do
        it "returns a number" do
            expect(ary.my_count).to be_instance_of(Fixnum)
        end
        
        context "when array has elements" do
            it { expect(ary.my_count).to eql(5) }
            it { expect([nil, nil, nil].my_count).to eql(3) }
        end
        
        context "when array is empty" do
            it { expect([].my_count).to eql(0) }
        end
        
        context "when passed nonenumerable objects" do
            it { expect{nil.my_count}.to raise_error(NoMethodError) }
            it { expect{99.my_count}.to raise_error(NoMethodError) }
            it { expect{"hi".my_count}.to raise_error(NoMethodError) }
        end
        
        context "when passed a block" do
            it "counts only evens" do
                expect(ary.my_count(&block)).to eql(3)
            end
        end
        
    end
    
    describe "#my_select" do
        it "returns an Array" do
            expect(ary.my_select).to be_instance_of(Array)
        end

        context "when array is empty" do
            it { expect([].my_count).to eql(0) }
        end
        
        context "non enumerable objects" do
            it { expect{nil.my_select}.to raise_error(NoMethodError) }
            it { expect{99.my_select}.to raise_error(NoMethodError) }
            it { expect{"hi".my_select}.to raise_error(NoMethodError) }
        end
        context "when passed a block" do
            it "returns only evens" do
                expect(ary.my_select(&block)).to eql([2,4,100])
            end
            it "returns only trues" do
                expect([true, false, true].my_select(&trueblock)).to eql([true, true]) 
            end
        end
    end
    
    describe "#my_any?" do
         it "returns true or false" do
            expect(ary.my_any?(&block)).to be_instance_of(TrueClass)
            expect([1,3].my_any?(&block)).to be_instance_of(FalseClass)
        end

        context "when array is empty" do
            it { expect([].my_any?(&block)).to eql(false) }
        end
        
        context "non enumerable objects" do
            it { expect{nil.my_any?(&block)}.to raise_error(NoMethodError) }
            it { expect{99.my_any?(&block)}.to raise_error(NoMethodError) }
            it { expect{"hi".my_any?(&block)}.to raise_error(NoMethodError) }
        end
        context "when passed a block" do
            it "returns true" do
                expect([true, false, true].my_any?(&trueblock)).to eql(true) 
            end
        end
    end
    
    describe "#my_map" do
    end
    describe "#my_inject" do
    end
end