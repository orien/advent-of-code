module AOC
  SOLUTIONS = Dir.glob(__dir__ + '/aoc/day*.rb').freeze
  SOLUTIONS.each { |f| require f }

  def self.celebrate
    (1..SOLUTIONS.count).each do |day|
      solution = AOC.const_get("Day#{day}")
      puts <<~MESSAGE
        Day ##{day}
          part 1: #{solution.part1(input(day))}
          part 2: #{solution.part2(input(day))}

      MESSAGE
    end
  end

  def self.input(day)
    File.new("input/day#{day}.txt", 'r')
  end
end
