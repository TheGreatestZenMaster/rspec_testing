require "running_week"

describe Run do
   
   describe "attributes" do
       
       subject do
           Run.new( :duration => 32,
                    :distance => 5.2,
                    :timestamp =>  "2016-10-19 15:30")
        end
        
        it { is_expected.to respond_to(:duration) }
        it { is_expected.to respond_to(:distance) }
        it { is_expected.to respond_to(:timestamp) }
    end
end