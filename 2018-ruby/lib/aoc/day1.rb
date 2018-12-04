require 'set'

module AOC
  module Day1
    def self.part1(input)
      input.map(&:to_i).sum
    end

    def self.part2(input)
      _change, state = input.map(&:to_i)
                            .cycle
                            .each_with_object({freq: 0, past_freq: Set[0]})
                            .find { |change, state|
                              state[:freq] += change
                              !state[:past_freq].add?(state[:freq])
                            }
      state[:freq]
    end
  end
end
