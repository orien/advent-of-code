module AOC
  module Day2
    def self.part1(input)
      state = input.first.split(",").map(&:to_i)
      state[1] = 12
      state[2] = 2
      process(state, 0).first
    end

    def self.part2(input)
    end

    def self.process(state, position)
      opcode = state[position]
      case opcode
      when 1
        new_state = operate(state, position, :+)
        process(new_state, position + 4)
      when 2
        new_state = operate(state, position, :*)
        process(new_state, position + 4)
      when 99
        state
      else
        raise "Unkown Opcode '#{opcode}'"
      end
    end

    def self.operate(state, position, operation)
      Array.new(state).tap do |new_state|
        operand1 = state[state[position + 1]]
        operand2 = state[state[position + 2]]
        new_state[state[position + 3]] = operand1.send(operation, operand2)
      end
    end
  end
end
