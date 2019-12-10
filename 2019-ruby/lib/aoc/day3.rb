module AOC
  module Day3
    def self.part1(input)
      centre = [0,0]
      path1 = path(instructions(input.readline), centre, [])
      path2 = path(instructions(input.readline), centre, [])
      intersections = path1 & path2
      intersections.map(&method(:manhattan_distance).curry[centre]).min
    end

    def self.part2(input)
    end

    def self.instructions(input_line)
      input_line.split(",").map { |movement| [ movement[0],  movement[1..].to_i] }
    end

    def self.path(((direction, distance), *instructions), (x, y), travelled)
      return travelled if direction.nil?
      move = case direction
             when "U" then Array.new(distance) { |m| [x, y + m + 1] }
             when "D" then Array.new(distance) { |m| [x, y - m - 1] }
             when "L" then Array.new(distance) { |m| [x - m - 1, y] }
             when "R" then Array.new(distance) { |m| [x + m + 1, y] }
             else raise "Unknown direction #{direction.inspect}"
             end
      path(instructions, move.last, travelled + move)
    end

    def self.manhattan_distance((x1, y1), (x2, y2))
      (x1 - x2).abs + (y1 - y2).abs
    end
  end
end
