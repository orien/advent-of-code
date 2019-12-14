module AOC
  module Day9
    def self.part1(input)
      data = input.first.split(",").map(&:to_i)
      output = []
      Program.new(data, [1], output).process
      output.first
    end

    def self.part2(input)
    end

    class Program
      def initialize(data, input, output)
        @data = Array.new(data)
        @input = input
        @output = output
        @position = 0
        @relative_base = 0
        @finished = false
      end

      attr_reader :data, :input, :output

      def process
        opcode = @data[@position] % 100
        @parameter_modes = (@data[@position] / 100).digits
        case opcode
        when 1 then add
        when 2 then multiply
        when 3 then input!
        when 4 then output!
        when 5 then jump_if_true
        when 6 then jump_if_false
        when 7 then less_than
        when 8 then equals
        when 9 then adjust_relative_base
        when 99
          @finished = true
        else
          raise "Unkown Opcode '#{opcode}' at #{position}"
        end
      end

      def add
        store(3, param1 + param2)
        @position += 4
        process
      end

      def multiply
        store(3, param1 * param2)
        @position += 4
        process
      end

      def input!
        return if @input.empty?
        store(1, @input.shift)
        @position += 2
        process
      end

      def output!
        @output << param1
        @position += 2
        process
      end

      def jump_if_true
        @position = param1 != 0 ? param2 : @position + 3
        process
      end

      def jump_if_false
        @position = param1 == 0 ? param2 : @position + 3
        process
      end

      def less_than
        store(3, param1 < param2 ? 1 : 0)
        @position += 4
        process
      end

      def equals
        store(3, param1 == param2 ? 1 : 0)
        @position += 4
        process
      end

      def adjust_relative_base
        @relative_base += param1
        @position += 2
        process
      end

      def store(param_num, value)
        address = parameter_address(@parameter_modes[param_num - 1], @position + param_num)
        @data[address] = value
      end

      def param1
        parameter_value(@parameter_modes[0], @position + 1)
      end

      def param2
        parameter_value(@parameter_modes[1], @position + 2)
      end

      def parameter_value(parameter_mode, position)
        @data[parameter_address(parameter_mode, position)] || 0
      end

      def parameter_address(parameter_mode, position)
        case parameter_mode
        when nil, 0 then @data[position]
        when 1 then position
        when 2 then @data[position] + @relative_base
        end
      end

      def finished?
        @finished
      end
    end
  end
end
