require 'prettyprint'

class SmokeBasin
    def initialize(input)
        @board = File.readlines(input, chomp: true).collect {|x| x.split("").map(&:to_i)}
    end

    def solve1
        low_points = find_low_points
        pp low_points.sum {|x| x+1 }
    end

    def find_low_points
        low_points = []
        for i in 0...@board.length() do
            for j in 0...@board[i].length() do
                if is_low_point?(i, @board.length(), j,@board[i].length() )
                    low_points << @board[i][j]
                end
            end
        end
        low_points
    end

    def find_low_points_coordinates
        low_points = []
        for i in 0...@board.length() do
            for j in 0...@board[i].length() do
                if is_low_point?(i, @board.length(), j,@board[i].length() )
                    low_points << [i,j]
                end
            end
        end
        low_points
    end

    def is_low_point?(i, max_i, j,max_j)
        point_height = @board[i][j]
        #up
        if (i - 1 >= 0 && @board[i-1][j] <= point_height)
            return false
        end
        #down
        if (i + 1 < max_i && @board[i+1][j] <= point_height)
            return false
        end
        #left
        if (j - 1 >= 0 && @board[i][j-1] <= point_height)
            return false
        end
        #right
        if (j + 1 < max_j && @board[i][j+1] <= point_height)
            return false
        end
        return true
    end

    def solve2
        low_points = find_low_points_coordinates
        basin_sizes = low_points.map {|x| find_basin_at_point(x[0],x[1])}
        pp basin_sizes.sort_by{|x| -x}.first(3).inject(:*)
    end
    
    def find_basin_at_point(i, j)
        visited = []
        need_to_visit = [[i,j]]
        basin_size = 0
        max_i =  @board.length()
        max_j = @board[i].length()
        while need_to_visit.length() > 0
            current_point = need_to_visit.shift
            if visited.include?(current_point)
                next
            end
            visited << current_point
            basin_size += 1
            higher_neighbors = find_higher_neighbors(current_point[0], max_i, current_point[1],max_j, visited)
            if higher_neighbors.length() > 0
                
                need_to_visit.push(*higher_neighbors)
            end
        end
        
        basin_size
    end

    def find_higher_neighbors(i, max_i, j,max_j, visited)
        higher_neighbors = []
        point_height = @board[i][j]
        if (i - 1 >= 0 && @board[i-1][j] != 9 && @board[i-1][j] > point_height && !visited.include?([i-1,j]))
            higher_neighbors << [i-1, j]
        end
        #down
        if (i + 1 < max_i && @board[i+1][j] != 9 && @board[i+1][j] > point_height && !visited.include?([i+1,j]))
            higher_neighbors << [i+1, j]
        end
        #left
        if (j - 1 >= 0 && @board[i][j-1] != 9 && @board[i][j-1] > point_height && !visited.include?([i,j-1]))
            higher_neighbors << [i, j-1]
        end
        #right
        if (j + 1 < max_j && @board[i][j+1] != 9 && @board[i][j+1] > point_height && !visited.include?([i,j+1]))
            higher_neighbors << [i, j+1]
        end
        higher_neighbors
    end
end

# smoke_basin = SmokeBasin.new("./data_input/input09_sample.txt")
# smoke_basin.solve1
# smoke_basin.solve2

real_smoke_basin = SmokeBasin.new("./data_input/input09.txt")
# real_smoke_basin.solve1
real_smoke_basin.solve2