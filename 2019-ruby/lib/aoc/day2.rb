module AOC
  module Day2
    def self.part1(input)
      run(program(input), 12, 2)
    end

    def self.part2(input)
      state = program(input)
      noun, verb = (0..99).to_a.permutation(2).find { |noun, verb| run(state, noun, verb) == 19690720 }
      100 * noun + verb
    end

    def self.program(input)
      input.first.split(",").map(&:to_i)
    end

    def self.run(state, noun, verb)
      state[1] = noun
      state[2] = verb
      process(state, 0).first
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
