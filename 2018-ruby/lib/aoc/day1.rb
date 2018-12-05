require 'set'

module AOC
  module Day1
    def self.part1(input)
      input.map(&:to_i).sum
    end

    def self.part2(input)
      _change, state =
        input.map(&:to_i)
        .cycle
        .each_with_object({frequency: 0, past_frequencies: Set[0]})
        .find { |change, state|
          state[:frequency] += change
          !state[:past_frequencies].add?(state[:frequency])
      }
      state[:frequency]
    end
  end
end
