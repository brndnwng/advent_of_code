require 'pp'
class Line
    attr_accessor :coordinates

    def initialize(input)
        @coordinates = input.gsub(" -> ", ",").split(",").map(&:to_i)
    end
    
    def horizontal?
        @coordinates[0] == @coordinates[2]
    end

    def vertical?
        @coordinates[1] == @coordinates[3]
    end

    def diagonal?
        @coordinates[0] != @coordinates[2] && @coordinates[1] != @coordinates[3]
    end

    def horiz_vert_points
        result = []
        if horizontal?
            if @coordinates[1] < @coordinates[3]
                start = @coordinates[1]
                finish = @coordinates[3]
            else
                start = @coordinates[3]
                finish = @coordinates[1]
            end
            for i in start..finish
                result << [@coordinates[0], i]
            end
        elsif vertical?
            if @coordinates[0] < @coordinates[2]
                start = @coordinates[0]
                finish = @coordinates[2]
            else
                start = @coordinates[2]
                finish = @coordinates[0]
            end
            for i in start..finish
                result << [ i, @coordinates[1]]
            end
        end
        
        result
    end
    def diagonal_points
        result = []
        if diagonal?
            i_val =[]
            j_val =[]
            if @coordinates[0] < @coordinates[2]
                i_val = (@coordinates[0]..@coordinates[2]).to_a
            else
   
                @coordinates[0].downto(@coordinates[2]) {|x| i_val << x}
            end

            if @coordinates[1] < @coordinates[3]
                j_val = (@coordinates[1]..@coordinates[3]).to_a
            else
              
                @coordinates[1].downto(@coordinates[3]) {|x| j_val << x}
            end
            i_val.each_with_index do |val, index|
                result << [val, j_val[index]]
            end
        end

        result
    end
end

class HydrothermalVenture
    def initialize(input)
        input_arr = File.read(input).split("\n")
        @lines = input_arr.map {|x| Line.new(x)}
        @board = Array.new(1000) {Array.new(1000, 0)}
    end

    def solve1
        @lines.each do |x| 
            points = x.horiz_vert_points
            points.each do |i, j|
                @board[i][j] += 1
            end
        end
        pp @board.transpose
        # pp @board.flatten.count {|x| x>1}
    end

    def solve2

        @lines.each do |x| 
            points = x.horiz_vert_points
            points.each do |i, j|
                @board[i][j] += 1
            end
            diagonal_points = x.diagonal_points
            diagonal_points.each do |i, j|
                @board[i][j] += 1
            end
        end
        # pp @board.transpose
        pp @board.flatten.count {|x| x>1}
        
    end
end

# sample = HydrothermalVenture.new("./data_input/input05_sample.txt")

# sample.solve1
# sample.solve2

real = HydrothermalVenture.new("./data_input/input05.txt")

# real.solve1
real.solve2