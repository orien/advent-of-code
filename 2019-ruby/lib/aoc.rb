module AOC
  # enable tail-call optimisation
  RubyVM::InstructionSequence.compile_option = {
    tailcall_optimization: true,
    trace_instruction: false
  }

  SOLUTIONS = Dir.glob(__dir__ + '/aoc/day*.rb').freeze
  SOLUTIONS.each { |f| require f }

  def self.celebrate
    (1..SOLUTIONS.count).each do |day|
      solution = AOC.const_get("Day#{day}")
      puts "Day ##{day}"
      print "  part 1: "
      puts solution.part1(input(day))
      print "  part 2: "
      puts solution.part2(input(day))
    end
  end

  def self.input(day)
    File.new("input/day#{day}.txt", 'r')
  end
end
