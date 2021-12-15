class Whale
    def initialize(input)
        @crabs = File.read(input,chomp: true).split(",").map(&:to_i)
    end

    def solve1
        median = calculate_median(@crabs)
        @crabs.sum { |x| (x-median).abs }
    end

    def solve2
        average = calculate_average(@crabs)
        ceil = @crabs.sum do |x|
            steps = (x-average.ceil).abs
            (steps + 1) * steps / 2
        end
        floor = @crabs.sum do |x|
            steps = (x-average.floor).abs
            (steps + 1) * steps / 2
        end
        [ceil,floor].min
    end

    def calculate_median(input_arr)
        sorted = input_arr.sort
        len = sorted.length
        (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
    
    def calculate_average(input_arr)
        (input_arr.sum.to_f / input_arr.length)
    end

end


whale = Whale.new("./data_input/input07_sample.txt")
puts whale.solve1
puts whale.solve2


real_whale = Whale.new("./data_input/input07.txt")
puts real_whale.solve1
puts real_whale.solve2