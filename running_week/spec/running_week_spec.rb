require "running_week"

describe Run do

  describe "attributes" do

    subject do
        duration = 32
        distance = 5.2,
        timestamp = "2014-12-22 20:30"
        Run.new(duration, distance, timestamp)
    end

    it { is_expected.to respond_to(:duration) }
    it "returns 32" do
        expect(subject.duration).to eql(32)
    end
    it { is_expected.to respond_to(:distance) }
    it { is_expected.to respond_to(:timestamp) }
  end
end


=begin
describe RunningWeek do
   
    describe ".count" do
        
        context "with 2 logged runs this week and 1 next" do
       
            before do
                2.times do
                    Run.log( :duration => rand(10),
                             :distance => rand(8),
                             :timestamp =>  "2016-10-11 15:30")
                end
                
                Run.log(:duration => rand(10),
                        :distance => rand(8),
                        :timestamp =>  "2016-10-19 15:30")
            end
            
            context "without arguements" do
                it "returns 3" do
                    expect(Run.count).to eql(3)
                end
            end
            
            context "with :week set to this week" do
                it "returns 2" do
                    expect(Run.count(:week => "2016-10-11")).to eql(2)
                end
            end
        end
    end
end
=end