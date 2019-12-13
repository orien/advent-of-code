module AOC
  module Day7
    def self.part1(input)
      data = input.first.split(",").map(&:to_i)
      (0..4).to_a.permutation.map { |phase_settings|
        io = Array.new(5) { |n| [phase_settings[n]] }
        io.first << 0
        output = []
        programs = Array.new(5) { |n| Program.new(data, io[n], io[n + 1] || output ) }
        programs.each(&:process)
        output.first
      }.max
    end

    def self.part2(input)
      data = input.first.split(",").map(&:to_i)
      (5..9).to_a.permutation.map { |phase_settings|
        io = Array.new(5) { |n| [phase_settings[n]] }
        io.first << 0
        programs = Array.new(5) { |n| Program.new(data, io[n], io[(n + 1) % 5]) }
        programs.each(&:process) until programs.all?(&:finished?)
        io.first.first
      }.max
    end

    class Program
      def initialize(data, input, output)
        @data = Array.new(data)
        @input = input
        @output = output
        @position = 0
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
        when 99
          @finished = true
        else
          raise "Unkown Opcode '#{opcode}' at #{position}"
        end
      end

      def add
        store(@data[@position + 3], param1 + param2)
        @position += 4
        process
      end

      def multiply
        store(@data[@position + 3], param1 * param2)
        @position += 4
        process
      end

      def input!
        return if @input.empty?
        store(@data[@position + 1], @input.shift)
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
        store(@data[@position + 3], param1 < param2 ? 1 : 0)
        @position += 4
        process
      end

      def equals
        store(@data[@position + 3], param1 == param2 ? 1 : 0)
        @position += 4
        process
      end

      def store(position, value)
        @data[position] = value
      end

      def param1
        parameter_value(@parameter_modes[0], @position + 1)
      end

      def param2
        parameter_value(@parameter_modes[1], @position + 2)
      end

      def parameter_value(parameter_mode, position)
        value = @data[position]
        case parameter_mode
        when nil, 0 then @data[value]
        when 1 then value
        end
      end

      def finished?
        @finished
      end
    end
  end
end
