class BinaryDiagnostic

    @input_arr = nil

    def initialize(input)
        @input_arr = File.readlines(input, chomp:true).map {|x| x.split("")}
    end

    def solve1
       ones = Array.new(@input_arr[0].length(), 0)
       zeroes = Array.new(@input_arr[0].length(), 0)

       for i in 0...@input_arr.length() do
        for j in 0...@input_arr[i].length() do
            if @input_arr[i][j].to_i == 0
                zeroes[j] = zeroes[j] + 1
            else
                ones[j] = ones[j] + 1
            end
        end
       end
       gamma = 0
       epislon = 0
       for i in 0...ones.length() do
           if ones[i] > zeroes[i]
            gamma = (gamma << 1) + 1
            epislon = epislon << 1
           else
            epislon = (epislon << 1) + 1
            gamma = gamma << 1
           end
       end
       puts gamma * epislon

    end

    def solve2
       position = 0
       oxygen = @input_arr
       co2 = @input_arr

       while oxygen.length() > 1 and position < @input_arr[0].length()  do
        oxygen = oxygen_helper(oxygen, position)
        position += 1
        
       end

       position = 0
       while co2.length() > 1 and position < @input_arr[0].length()  do
        co2 = co2_helper(co2, position)
        position += 1
        
       end
       

       print oxygen.join("").to_i(2) * co2.join("").to_i(2)
    end

    def oxygen_helper(input_array, position)
        ones = 0
        zeroes = 0
        for i in 0...input_array.length() do
            if input_array[i][position].to_i == 0
                zeroes += 1
            else
                ones += 1
            end
        end

        if zeroes > ones
            max = 0
        else
            max = 1
        end
        input_array.select do |x| 
            # puts x
            x[position].to_i == max 
        end
    end

    def co2_helper(input_array, position)
        ones = 0
        zeroes = 0
        for i in 0...input_array.length() do
            if input_array[i][position].to_i == 0
                zeroes += 1
            else
                ones += 1
            end
        end

        if ones < zeroes
            min = 1
        else
            min = 0
        end
        input_array.select do |x| 
            # puts x
            x[position].to_i == min 
        end
    end
end

#sample = BinaryDiagnostic.new("./data_input/input03_sample.txt")
# sample.solve1
#sample.solve2

real = BinaryDiagnostic.new("./data_input/input03.txt")
# real.solve1
 real.solve2