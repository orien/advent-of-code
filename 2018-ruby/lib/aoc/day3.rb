module AOC
  module Day3
    def self.part1(input)
      claim_state(claims(input)).values.select { |c| c > 1 }.size
    end

    def self.part2(input)
      claims = claims(input)
      state = claim_state(claims)
      claim_without_overlaps = claims.find { |claim|
        (claim.x..claim.xi).all? { |x|
          (claim.y..claim.yi).all? { |y|
            state[[x, y]] == 1
          }
        }
      }
      claim_without_overlaps.id
    end

    def self.claims(input)
      input.map(&Claim.method(:parse)).compact
    end

    def self.claim_state(claims)
      claims.reduce(Hash.new(0)) { |state, claim|
        (claim.x..claim.xi).each { |x|
          (claim.y..claim.yi).each { |y|
            state[[x, y]] += 1
          }
        }
        state
      }
    end

    class Claim
      PATTERN = /#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/.freeze

      def self.parse(string)
        match = PATTERN.match(string)
        new(match) if match
      end

      def initialize(match)
        @id = match[:id]

        @x = match[:x].to_i
        @width = match[:width].to_i
        @xi = @x + @width - 1

        @y = match[:y].to_i
        @height = match[:height].to_i
        @yi = @y + @height - 1
      end

      attr_reader :id, :x, :xi, :width, :y, :yi, :height
    end
  end
end
