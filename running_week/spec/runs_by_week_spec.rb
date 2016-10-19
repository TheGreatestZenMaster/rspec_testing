require "running_week"

describe Run do

  describe ".count" do

    context "with 2 logged runs this week and 1 in next" do

      before(:all) do
        2.times do
            Run.new(:duration => rand(30),
                    :distance => rand(8),
                    :timestamp => "2016-10-11 20:30")
        end
        Run.new(:duration => rand(30), :distance => rand(8), :timestamp => "2016-10-19 20:30")
      end

      context "without arguments" do
        it "returns 3" do
          expect(Run.count).to eql(3)
        end
      end

      context "with :week set to this week" do
        it "returns 2" do
          expect(Run.count("2016-10-11")).to eql(2)
        end
      end
    end
  end
end