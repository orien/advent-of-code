module AOC
  module Day2
    def self.part1(input)
      twos, threes = input.reduce([0, 0]) { |(twos, threes), line|
        line_counts = line.each_char.reduce(Hash.new(0)) { |counts_by_char, char|
          counts_by_char[char] += 1
          counts_by_char
        }.values
        [
          line_counts.include?(2) ? twos + 1 : twos,
          line_counts.include?(3) ? threes + 1 : threes
        ]
      }
      twos * threes
    end

    def self.part2(input)
      (id1, id2) = input.each.map(&:chomp).to_a.combination(2).find { |id1, id2|
        matching_characters(id1, id2).length == id1.length - 1
      }
      matching_characters(id1, id2)
    end

    def self.matching_characters(id1, id2)
      id1.chars.zip(id2.chars).reduce('') { |match, (char1, char2)|
        char1 == char2 ? match + char1 : match
      }
    end
  end
end
