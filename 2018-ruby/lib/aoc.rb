Dir.glob(__dir__ + '/aoc/day*.rb').each { |f| require f }

module AOC
  def self.celebrate
    (1..4).each do |day|
      solution = AOC.const_get("Day#{day}")
      puts <<~MESSAGE
        Day ##{day}
          part 1: #{solution.part1(file(day))}
          part 2: #{solution.part2(file(day))}

      MESSAGE
    end
  end

  def self.file(day)
    File.new("input/day#{day}.txt", 'r')
  end
end
