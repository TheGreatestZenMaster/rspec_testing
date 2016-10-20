require "greeter"

describe "RSpecGreeter" do
    
    describe ".greet" do
        
        context "when it recieves the greet message" do
            it "returns 'Hello RSpec!" do
                expect(RSpecGreeter.greet).to eql("Hello RSpec!")
            end
        end
    end
end