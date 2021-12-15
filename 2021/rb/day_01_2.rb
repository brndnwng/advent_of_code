input_arr = File.readlines("./data_input/input01.txt").grep(/\d+/, &:to_i)

triplets = input_arr.each_cons(3)
puts input_arr
count = 0
result = triplets.each_cons(2) do |a, b| 
    if b.sum > a.sum
        count += 1
    end
end

puts count