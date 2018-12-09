module AOC
  module Day9

    def self.part1(input)
      number_of_players, last_marble = load(input)
      score = play(number_of_players, last_marble)
      score.values.max
    end

    def self.part2(input)
      number_of_players, last_marble = load(input)
      score = play(number_of_players, last_marble * 100)
      score.values.max
    end

    def self.play(players, last_marble)
      _circle, score = (1..last_marble).lazy.zip((1..players).cycle)
        .each_with_object([Circle.new, Hash.new(0)]) do | (marble, player), (circle, score)|
        if marble % 23 == 0
          score[player] += marble
          circle.navigate(:anti_clockwise, 7)
          score[player] += circle.remove
        else
          circle.navigate(:clockwise, 2)
          circle.insert(marble)
        end
      end
      score
    end

    PATTERN = /^(?<players>\d+) players; last marble is worth (?<last_marble>\d+) points$/.freeze
    def self.load(input)
      match = PATTERN.match(input.read)
      [match[:players].to_i, match[:last_marble].to_i]
    end

    class Circle
      class Marble
        def initialize(number, clockwise = self, anti_clockwise = self)
          @number, @clockwise, @anti_clockwise = number, clockwise, anti_clockwise
        end
        attr_reader :number
        attr_accessor :clockwise, :anti_clockwise
      end

      def initialize
        @current = Marble.new(0)
      end

      def insert(marble_number)
        @current = Marble.new(marble_number, @current, @current.anti_clockwise)
        @current.clockwise.anti_clockwise = @current
        @current.anti_clockwise.clockwise = @current
      end

      def remove
        raise 'cannot remove last mable from circle' if @current.clockwise == @current
        removed = @current.number
        @current.clockwise.anti_clockwise = @current.anti_clockwise
        @current.anti_clockwise.clockwise = @current.clockwise
        @current = @current.clockwise
        removed
      end

      def navigate(direction, count = 1)
        count.times { @current = @current.send(direction) }
      end
    end
  end
end
