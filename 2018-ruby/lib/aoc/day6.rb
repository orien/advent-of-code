module AOC
  module Day6
    def self.part1(input)
      CoordinateArea.new(
        Grid.new(
          input.map { |line| Coordinate.new(*line.split(',').map(&:to_i)) }
        )
      ).largest_non_infinite_area
    end

    def self.part2(input, limit = 10_000)
      coordinates = input.map { |line| Coordinate.new(*line.split(',').map(&:to_i)) }
      grid = Grid.new(coordinates)
      grid.points_around_coordinates
          .map { |(x, y)| coordinates.map { |coordinate| coordinate.manhattan_distance(x, y) }.sum }
          .select { |total_distance| total_distance < limit }
          .count
    end

    class CoordinateArea
      def initialize(grid)
        @grid = grid
      end

      def largest_non_infinite_area
        @grid.coordinates
             .reject(&method(:infinite?))
             .map(&method(:area_of_points_closest_to_coordinate))
             .max
      end

      def infinite?(coordinate)
        coordinates_to_closest_points[coordinate].any? { |x, y|
          [@grid.min_x, @grid.max_x].include?(x) ||
            [@grid.min_y, @grid.max_y].include?(y)
        }
      end

      def area_of_points_closest_to_coordinate(coordinate)
        coordinates_to_closest_points[coordinate].size
      end

      def coordinates_to_closest_points
        @coordinates_to_closest_points ||=
          @grid.points_around_coordinates
               .reduce(Hash.new { |h,k| h[k] = [] }) { |areas, (x, y)|
                 (distance, coordinate), (second_closest_distance, _) =
                   @grid.coordinates.map { |coord|
                     [ coord.manhattan_distance(x, y), coord ]
                   }.sort { |(d1, _), (d2, _)| d1 <=> d2 }[0, 2]
                 areas[coordinate] << [x, y] unless distance == second_closest_distance
                 areas
               }
      end
    end

    class Grid
      def initialize(coordinates = [])
        @coordinates = coordinates
        @min_x, @max_x = coordinates.map(&:x).minmax
        @min_y, @max_y = coordinates.map(&:y).minmax
      end

      attr_reader :coordinates, :min_x, :max_x, :min_y, :max_y

      def points_around_coordinates
        (min_x..max_x).to_a.product((min_y..max_y).to_a)
      end
    end

    class Coordinate
      def initialize(x, y)
        @x = x
        @y = y
      end

      attr_reader :x, :y

      def manhattan_distance(x, y)
        (x - self.x).abs + (y - self.y).abs
      end
    end
  end
end
