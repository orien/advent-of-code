module AOC
  module Day7
    PATTERN = /^Step (?<requirement>[A-Z]) must be finished before step (?<step>[A-Z]) can begin.$/.freeze

    def self.part1(input)
      instructions = parse_instructions(input)
      step_order(instructions, [], candidates(instructions)).join
    end

    def self.parse_instructions(input)
      input.map { |line|
        match = PATTERN.match(line)
        [match[:step], match[:requirement]]
      }.reduce(Hash.new { |h, k| h[k] = [] }) { |memo, (step, requirement)|
        memo[step] << requirement
        memo[requirement]
        memo
      }
    end

    def self.step_order(instructions, order, candidates)
      return order if candidates.empty?
      new_order = order + [candidates.first]
      step_order(instructions, new_order, candidates(instructions, new_order))
    end

    def self.candidates(instructions, complete = [], in_process = [])
      instructions.reject { |step, requirements|
        complete.include?(step) || in_process.include?(step) ||
          requirements.any? { |requirement| !complete.include?(requirement) }
      }.map(&:first).sort
    end

    def self.part2(input, number_of_workers: 5, base_step_time: 60)
      instructions = parse_instructions(input)
      workers = []
      number_of_workers.times { workers << Worker.new(base_step_time) }
      work(0, workers, instructions, [])
    end

    def self.work(second, workers, instructions, complete)
      candidates = candidates(instructions, complete, workers.map(&:step).compact)
      return second if candidates.empty? && workers.all?(&:idle?)
      workers.select(&:idle?).each do |worker|
        worker.assign(candidates.delete_at(0)) if candidates.any?
      end
      complete += workers.map(&:work).compact
      work(second + 1, workers, instructions, complete)
    end

    class Worker
      def initialize(base_step_time)
        @base_step_time = base_step_time
        @step = nil
        @eta = 0
      end

      attr_reader :step

      def work
        unless idle?
          @eta -= 1
          if @eta == 0
            step = @step
            @step = nil
            step
          end
        end
      end

      def assign(step)
        @eta = time_required_for_step(step)
        @step = step
      end

      def idle?
        @step.nil?
      end

      def time_required_for_step(step)
        @base_step_time + 1 + step.ord - 'A'.ord
      end
    end
  end
end
