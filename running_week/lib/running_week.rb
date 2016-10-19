class Run
    attr_accessor :duration, :distance, :timestamp
    def initialize(duration, distance, timestamp)
        @duration = duration
        @distance = distance
        @timestamp = timestamp
    end
end