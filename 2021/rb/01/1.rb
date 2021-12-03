input_arr = File.readlines("./data_input/input01.txt").grep(/\d+/, &:to_i)

count = 0
result = input_arr.each_cons(2).count { |a, b| b > a}

puts result
puts count