class RunningWeek
    attr_reader :week, :runs
    
    def intialize(week, runs)
        @week = week
        @runs = runs
    end
    
    def runs(week, runs)
        @runs
    end
    
end

class Run
    attr_reader :duration, :distance, :timestamp, :count
    @@count = 0
    @@week = Hash.new
    def initialize(args)
        args.each do |k,v|
            instance_variable_set("@#{k}", v) unless v.nil?
        end
        @@count += 1
        set_week
    end
    
    def set_week
        week = @timestamp[0..9]
        if @@week.empty? || !@@week.key?(week)
            @@week[week] = 1
        elsif @@week.key?(week)
            @@week[week] += 1
        end
    end

    def self.count(week=nil)
        week.nil?? @@count: @@week[week]
    end
end


