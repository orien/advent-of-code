module AOC
  module Day5
    def self.part1(input)
      polymer = input.read.chomp.chars
      react(polymer).size
    end

    def self.part2(input)
      polymer = input.read.chomp.chars
      reacted = react(polymer)
      unit_types =
        reacted.uniq.select { |unit_type|
          unit_type.upcase == unit_type
        }
      unit_types.map { |unit_type|
        react(
          reacted.reject { |unit|
            unit.upcase == unit_type
          }
        ).size
      }.min
    end

    def self.react(polymer)
      i = 0
      while i < polymer.length - 1
        unit1, unit2 = polymer[i, 2]
        if unit1 != unit2 && unit1.upcase == unit2.upcase
          2.times { polymer.delete_at(i) }
          i -= 1 unless i == 0
        else
          i += 1
        end
      end
      polymer
    end
  end
end
