module AOC
  module Day5
    def self.part1(input)
      state, out = process(program(input), 0, [1])
      out.join
    end

    def self.part2(input)
      state, out = process(program(input), 0, [5])
      out.join
    end

    def self.program(input)
      input.first.split(",").map(&:to_i)
    end

    def self.process(state, position, input, output = [])
      opcode = state[position] % 100
      parameter_modes = (state[position] / 100).digits
      case opcode
      when 1 then add(state, position, parameter_modes, input, output)
      when 2 then multiply(state, position, parameter_modes, input, output)
      when 3 then input(state, position, input, output)
      when 4 then output(state, position, parameter_modes, input, output)
      when 5 then jump_if_true(state, position, parameter_modes, input, output)
      when 6 then jump_if_false(state, position, parameter_modes, input, output)
      when 7 then less_than(state, position, parameter_modes, input, output)
      when 8 then equals(state, position, parameter_modes, input, output)
      when 99 then [state, output]
      else
        raise "Unkown Opcode '#{opcode}' at #{position}"
      end
    end

    def self.add(state, position, parameter_modes, input, output)
      operand1, operand2 = parameter_values(state, position, parameter_modes, 2)
      new_state = store(state, state[position + 3], operand1 + operand2)
      process(new_state, position + 4, input, output)
    end

    def self.multiply(state, position, parameter_modes, input, output)
      operand1, operand2 = parameter_values(state, position, parameter_modes, 2)
      new_state = store(state, state[position + 3], operand1 * operand2)
      process(new_state, position + 4, input, output)
    end

    def self.input(state, position, (first, *input), output)
      new_state = store(state, state[position + 1], first)
      process(new_state, position + 2, input, output)
    end

    def self.output(state, position, parameter_modes, input, output)
      param, = parameter_values(state, position, parameter_modes)
      process(state, position + 2, input, output + [param])
    end

    def self.jump_if_true(state, position, parameter_modes, input, output)
      param1, param2 = parameter_values(state, position, parameter_modes, 2)
      new_position = param1 != 0 ? param2 : position + 3
      process(state, new_position, input, output)
    end

    def self.jump_if_false(state, position, parameter_modes, input, output)
      param1, param2 = parameter_values(state, position, parameter_modes, 2)
      new_position = param1 == 0 ? param2 : position + 3
      process(state, new_position, input, output)
    end

    def self.less_than(state, position, parameter_modes, input, output)
      param1, param2 = parameter_values(state, position, parameter_modes, 2)
      lt = param1 < param2 ? 1 : 0
      new_state = store(state, state[position + 3], lt)
      process(new_state, position + 4, input, output)
    end

    def self.equals(state, position, parameter_modes, input, output)
      param1, param2 = parameter_values(state, position, parameter_modes, 2)
      e = param1 == param2 ? 1 : 0
      new_state = store(state, state[position + 3], e)
      process(new_state, position + 4, input, output)
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
