module AOC
  module Day5
    def self.part1(input)
      process(program(input), 0)
      nil
    end

    def self.part2(input)
    end

    def self.program(input)
      input.first.split(",").map(&:to_i)
    end

    def self.process(state, position)
      opcode = state[position] % 100
      parameter_modes = (state[position] / 100).digits
      case opcode
      when 1 then add(state, position, parameter_modes)
      when 2 then multiply(state, position, parameter_modes)
      when 3 then input(state, position)
      when 4 then output(state, position, parameter_modes)
      when 99 then state
      else
        raise "Unkown Opcode '#{opcode}' at #{position}"
      end
    end

    def self.add(state, position, parameter_modes)
      operand1, operand2 = parameter_values(state, position, parameter_modes, 2)
      new_state = store(state, state[position + 3], operand1 + operand2)
      process(new_state, position + 4)
    end

    def self.multiply(state, position, parameter_modes)
      operand1, operand2 = parameter_values(state, position, parameter_modes, 2)
      new_state = store(state, state[position + 3], operand1 * operand2)
      process(new_state, position + 4)
    end

    def self.input(state, position)
      print "\ninput: "
      new_state = store(state, state[position + 1], gets.to_i)
      process(new_state, position + 2)
    end

    def self.output(state, position, parameter_modes)
      param, = parameter_values(state, position, parameter_modes)
      print param
      process(state, position + 2)
    end

    def self.store(state, position, value)
      Array.new(state).tap { |new_state| new_state[position] = value }
    end

    def self.parameter_values(state, position, parameter_modes, n = 1)
      Array.new(n) do |i|
        value = state[position + i + 1]
        parameter_modes[i] == 1 ? value : state[value]
      end
    end
  end
end
