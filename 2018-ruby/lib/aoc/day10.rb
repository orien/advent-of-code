module AOC
  module Day10
    def self.part1(input)
      point_velocities = load(input)
      _second, points = find_message(point_velocities)
      plot(points)
    end

    def self.part2(input)
      point_velocities = load(input)
      second, _points = find_message(point_velocities)
      second
    end

    def self.find_message(point_velocities)
      second = 2
      points = points(second - 1, point_velocities)
      next_points = points(second, point_velocities)
      until worse?(points, next_points)
        second += 1
        points, next_points = next_points, points(second, point_velocities)
      end
      [second, points]
    end

    def self.points(second, point_velocities)
      point_velocities.map { |px, py, vx, vy|
        [px + vx * (second + 1), py + vy * (second + 1)]
      }
    end

    def self.worse?(points1, points2)
      x_range(points2) > x_range(points1)
    end

    def self.x_range(points)
      x_min, x_max = points.map(&:first).minmax
      x_max - x_min
    end

    def self.plot(points)
      y_min, y_max = points.map(&:last).minmax
      x_min, x_max = points.map(&:first).minmax
      (y_min..y_max).reduce("\n") { |message, y|
        (x_min..x_max).reduce(message) { |line, x|
          line << (points.include?([x, y]) ? '#' : ' ')
        }
        message << "\n"
      }
    end

    PATTERN = /^position=<\s*(-?\d+),\s*(-?\d+)> velocity=<\s*(-?\d+),\s*(-?\d+)>$/.freeze
    def self.load(input)
      input.map { |line| PATTERN.match(line).captures.map(&:to_i) }
    end
  end
end
