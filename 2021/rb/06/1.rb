require 'pp'
class LanternFish
    def initialize(input)
        @fish = File.read(input,chomp: true).split(",").map(&:to_i)
    end

    def solve1(days)
        for i in 1..days do
           new_fish = 0
           new_fish_arr = @fish.map do |x, i|
             if x == 0
                new_fish += 1
                x = 6 
             else
                x -= 1
             end
             x
            end
             
          new_fish.times { new_fish_arr << 8}
          @fish = new_fish_arr
        end
        pp @fish.length
    end

    def solve2(days)
        fish_count_states = Array.new(9,0)
        @fish.each {|x| fish_count_states[x] += 1}
        for i in 1..days
            new_fish = fish_count_states[0]
            for i in 0..7
                fish_count_states[i] = fish_count_states[i+1]
            end
            fish_count_states[6] += new_fish
            fish_count_states[8] = new_fish
        end
        puts fish_count_states.sum
    end
end

# fish = LanternFish.new("./data_input/input06_sample.txt")
# fish.solve1(18)

real = LanternFish.new("./data_input/input06.txt")
real.solve2(256)