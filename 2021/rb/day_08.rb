require 'set'
require 'prettyprint'

class SevenSegment
    def initialize(input)
        @signals = File.readlines(input, chomp: true).map  {|x| x.split(" | ").map {|y| y.split(" ")}}
    end

    def solve1
        result = @signals.sum do | line |
            line[1].count do |output|
                [2,4,3,7].include?(output.length)
            end
        end

        puts result
    end

    def solve2
        output_nums = @signals.map do | line |
            signal = line[0]
            output = line[1]
            signal_num = find_output(signal, output)
            output_num = line[1].collect { |x| signal_num[x.split('').sort.join]}
            pp output_num
        end
        puts output_nums.sum{|x| x.join.to_f}
    end

    def find_output(signal, output)
        signal_num = {}
        one = find_and_remove!(signal) {|s| s.size == 2}.split('').sort.join
        signal_num[one] = 1
        seven = find_and_remove!(signal) {|s| s.size == 3}.split('').sort.join
        signal_num[seven] = 7
        eight = find_and_remove!(signal) {|s| s.size == 7}.split('').sort.join
        signal_num[eight] = 8
        four = find_and_remove!(signal) {|s| s.size == 4}.split('').sort.join
        signal_num[four] = 4
        three = find_and_remove!(signal) {|s| s.size == 5 && one.split('').all? { |e| s.include?(e)}}.split('').sort.join
        signal_num[three] = 3
        five = find_and_remove!(signal) {|s| s.size == 5 && (four.split('') - s.split('')).size == 1}.split('').sort.join
        signal_num[five] = 5
        two = find_and_remove!(signal) {|s| s.size == 5}.split('').sort.join
        signal_num[two] = 2
        nine = find_and_remove!(signal) {|s| three.split('').all? { |e| s.include?(e)}}.split('').sort.join
        signal_num[nine] = 9
        zero = find_and_remove!(signal) {|s| one.split('').all? { |e| s.include?(e)}}.split('').sort.join
        signal_num[zero] = 0
        six = signal.first.split('').sort.join
        signal_num[six] = 6

        signal_num
    end

    def find_and_remove!(signals, &block)
        s = signals.find(&block)
        signals.delete(s)
        
      end
end

# segment = SevenSegment.new("./data_input/input08_sample.txt")
# # segment.solve1
# segment.solve2

segment_real = SevenSegment.new("./data_input/input08.txt")
# segment_real.solve1
segment_real.solve2
# 1 - 2
# 4 - 4
# 7 - 3
# 8 - 7