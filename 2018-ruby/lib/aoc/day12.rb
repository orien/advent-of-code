module AOC
  module Day12
    def self.part1(input)
      state, notes = load(input)
      20.times do
        state = next_generation(state, notes)
      end
      state.keys.sum
    end

    def self.part2(input)
      state, notes = load(input)
      predictor = Predictor.new(state)
      until predictor.predictable?
        state = next_generation(state, notes)
        predictor.new_state(state)
      end
      predictor.predict(50_000_000_000)
    end

    def self.next_generation(state, notes)
      min, max = state.keys.minmax
      ((min - 2)..(max + 2)).reduce(Hash.new('.')) { |new_state, i|
        if notes["#{state[i - 2]}#{state[i - 1]}#{state[i]}#{state[i + 1]}#{state[i + 2]}"]
          new_state[i] = '#'
        end
        new_state
      }
    end

    def self.load(input)
      initial_state = /(?<initial_state>[#.]+)/.match(input.first)[:initial_state]
      state = initial_state.chars.each_with_object(Hash.new('.')).with_index { |(c, hash), i| hash[i] = c }
      notes = input.reduce(Hash.new(false)) { |notes, line|
        if match = /^(?<condition>[#.]+) => (?<result>[#])$/.match(line)
          notes[match[:condition]] = true
        end
        notes
      }
      [state, notes]
    end

    class Predictor
      def initialize(state)
        @generation = 0
        @recent_growth = Array.new(7)
        @score = score(state)
      end

      def predict(target_generation)
        @score + @recent_growth.first * (target_generation - @generation)
      end

      def predictable?
        @recent_growth.any? && @recent_growth.uniq.size == 1
      end

      def new_state(state)
        @generation += 1
        @recent_growth.shift
        old_score, @score = @score, score(state)
        @recent_growth << (@score - old_score)
      end

    private

      def score(state)
        state.keys.sum
      end
    end
  end
end
