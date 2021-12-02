class SubDepth

    @input_arr = nil

    def initialize(input)
        @input_arr = File.readlines(input).map {|x| x.split(" ")}
    end

    def solve1
        horizontal = 0
        depth = 0
        
        @input_arr.each do | dir, unit|
            unit_i = unit.to_i
            case dir
            when "forward"
                horizontal += unit_i
            when "up"
                depth -= unit_i
            when "down"
                depth += unit_i
            end
        end 
        
        puts horizontal * depth
    end

    def solve2
        horizontal = 0
        depth = 0
        aim = 0

        @input_arr.each do | dir, unit|
            unit_i = unit.to_i
            case dir
            when "forward"
                horizontal += unit_i
                depth += aim * unit_i
            when "up"
                aim -= unit_i
            when "down"
                aim += unit_i
            end
        end 
        
        puts horizontal * depth
    end
end

sample = SubDepth.new("./data_input/input02_sample.txt")
sample.solve1
sample.solve2

real = SubDepth.new("./data_input/input02.txt")
real.solve1
real.solve2