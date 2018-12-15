module AOC
  module Day11
    TABLE_SIZE = 300

    def self.part1(input)
      serial = input.read.to_i
      grid_size = 3
      table = SummedAreaTable.new(TABLE_SIZE, &method(:power_level).curry[serial])
      points(TABLE_SIZE - grid_size + 1).map { |x, y|
        [table.grid_area(x, y, grid_size), [x, y]]
      }.max.last
    end

    def self.part2(input)
      serial = input.read.to_i
      table = SummedAreaTable.new(TABLE_SIZE, &method(:power_level).curry[serial])
      points(TABLE_SIZE).map { |x, y|
        (1..TABLE_SIZE - [x, y].max + 1).map { |size|
          [table.grid_area(x, y, size), [x, y, size]]
        }.max
      }.max.last
    end

    def self.power_level(serial, x, y)
      rack_id = x + 10
      ((rack_id * y + serial) * rack_id) % 1000 / 100 - 5
    end

    def self.points(max)
      Enumerator.new { |yielder|
        (1..max).each { |y|
          (1..max).each { |x|
            yielder << [x, y]
          }
        }
      }.lazy
    end

    # https://en.wikipedia.org/wiki/Summed-area_table
    class SummedAreaTable
      def initialize(width, height = width)
        @table = Array.new(height + 1) { Array.new(width + 1) }
        (1..height).each do |y|
          (1..width).each do |x|
            @table[y][x] = yield(x, y) + area_at(x, y - 1) + area_at(x - 1, y) - area_at(x - 1, y - 1)
          end
        end
      end

      def area_at(x, y)
        @table[y][x] || 0
      end

      def grid_area(x, y, width, height = width)
        x0 = x - 1
        y0 = y - 1
        x1 = x + width - 1
        y1 = y + height - 1
        area_at(x1, y1) - area_at(x1, y0) - area_at(x0, y1) + area_at(x0, y0)
      end
    end
  end
end
