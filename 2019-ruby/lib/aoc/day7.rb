module AOC
  module Day7
    def self.part1(input)
      state = Day5.program(input)
      (0..4).to_a.permutation.map { |phase_settings|
        phase_settings.reduce(0) { |signal, phase_setting|
          _, out = Day5.process(state, 0, [phase_setting, signal])
          out.first
        }
      }.max
    end

    def self.part2(input)
    end
  end
end
