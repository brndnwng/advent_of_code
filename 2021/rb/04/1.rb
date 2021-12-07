class Board
    attr_accessor :board, :marks

    def initialize(input)
        @board = input.split("\n").map { |x| x.split(" ").map(&:to_i)}
        @marks = Array.new(5) { Array.new(5) { false } }
    end

    def mark(number)
        @board.each_with_index do |row, i|
            row.each_with_index do|num, j|
                if num == number
                    @marks[i][j] = true
                end
            end
        end
    end

    def won_row?
        @marks.any? {|row| row.all?}
    end

    def won_col?
        @marks.transpose.any? {|col| col.all?}
    end
    
    def won?
        @won ||= won_row? || won_col?
    end

    def unmarked_sum
        unmarked_sum = 0
        @marks.each_with_index do |row, i| 
            @marks.each_with_index do |num, j| 
                unmarked_sum += board[i][j] unless @marks[i][j]
            end
        end
        return unmarked_sum
    end
end

class GiantSquid
    def initialize(input)
        @input_arr = File.read(input).split("\n\n")
        @numbers = @input_arr.shift.split(",").map(&:to_i)
        @boards = @input_arr.map{|part| Board.new(part)}
    end

    def solve1
        @numbers.each do |num| 
            @boards.each{ |x| x.mark(num)}
            if @boards.count(&:won?) == 1 
                @last_called = num
                puts (@boards.find(&:won?).unmarked_sum * @last_called)
                return
            end
        end
    end

    def solve2
        num_boards = @boards.length()
        num_boards_solved = 0
        @numbers.each do |num| 
            @boards.each{ |x| x.mark(num)}

            while @boards.count(&:won?) > 0 && @boards.length() > 1
                @boards = @boards.reject(&:won?)
            end

            if @boards.length() == 1 && @boards.count(&:won?) == 1 
                @last_called = num
                puts (@boards.find(&:won?).unmarked_sum * @last_called)
                return
            end
        end
    end
end

# sample = GiantSquid.new("./data_input/input04_sample.txt")

# sample.solve1
# sample.solve2

real = GiantSquid.new("./data_input/input04.txt")

real.solve1
real.solve2