require "running_week"

describe Run do

  describe "attributes" do

    subject do
        Run.new(:duration => 32,
            :distance => 5.2,
            :timestamp => "2014-12-22 20:30")
    end

    it { is_expected.to respond_to(:duration) }
    it "returns 32" do
        expect(subject.duration).to eql(32)
    end
    it { is_expected.to respond_to(:distance) }
    it { is_expected.to respond_to(:timestamp) }
  end
end
