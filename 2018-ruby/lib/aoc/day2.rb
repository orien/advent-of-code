module AOC
  module Day2
    def self.part1(input)
      twos = 0
      threes = 0
      input.each do |line|
        counts = {}
        line.each_char { |char| counts[char] = line.count(char) }
        twos += 1 if counts.values.include?(2)
        threes += 1 if counts.values.include?(3)
      end
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
