module AOC
  module Day14
    def self.part1(input)
      scores([3, 7])
        .drop(input.read.to_i)
        .take(10)
        .to_a
        .join
    end

    def self.part2(input)
      pattern = input.read.chomp.chars.map(&:to_i)
      match = Array.new(pattern.size, nil)
      _, last_index = scores([3, 7]).with_index.find do |score, _i|
        match.shift
        match << score
        match == pattern
      end
      last_index - pattern.size + 1
    end

    def self.scores(scoreboard)
      Enumerator.new do |yielder|
        elfs = Array.new(2) { |i| i }
        scoreboard.each(&yielder.method(:<<))
        loop do
          new_scores = elfs.map { |elf| scoreboard[elf] }.sum.digits.reverse
          new_scores.each(&yielder.method(:<<))
          scoreboard.concat(new_scores)
          elfs = elfs.map { |elf| (elf + scoreboard[elf] + 1) % scoreboard.size }
        end
      end.lazy
    end
  end
end
