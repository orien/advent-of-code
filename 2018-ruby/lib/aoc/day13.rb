module AOC
  module Day13
    def self.part1(input)
      position, _cart = ticks(*load(input))
        .find { |carts| carts.values.any?(&:crashed?) }
        .find { |_position, cart| cart.crashed? }
      position
    end

    def self.part2(input)
      position, _cart = ticks(*load(input))
        .find { |carts| carts.values.reject(&:crashed?).size == 1 }
        .find { |_position, cart| !cart.crashed? }
      position
    end

    def self.load(input)
      input.each_with_index.with_object([{}, {}]) do |(line, y), (track, carts)|
        line.chars.each_with_index do |char, x|
          case char
          when '/', '\\', '|', '-', '+'
            track[[x, y]] = char
          when '>', '<'
            track[[x, y]] = '-'
            carts[[x, y]] = Cart.new(char)
          when '^', 'v'
            track[[x, y]] = '|'
            carts[[x, y]] = Cart.new(char)
          end
        end
      end
    end

    def self.ticks(track, carts)
      Enumerator.new do |yielder|
        loop do
          carts = tick(track, carts)
          yielder << carts
        end
      end
    end

    def self.tick(track, carts)
      carts.sort_by { |position, _cart| position.reverse }.each do |position, cart|
        next if cart.crashed?
        new_position = cart.move(track, position)
        existing_cart = carts[new_position]
        if existing_cart && !existing_cart.crashed?
          cart.crash
          existing_cart.crash
        end
        carts[new_position] = carts.delete(position)
      end
      carts
    end

    def self.plot(track, carts)
      y_max = track.keys.map(&:last).max
      x_max = track.keys.map(&:first).max
      (0..y_max).reduce("\n") { |message, y|
        (0..x_max).reduce(message) { |line, x|
          line << (carts.key?([x, y]) ? carts[[x, y]].direction : track[[x, y]] || ' ')
        }
        message << "\n"
      }
    end

    class Cart
      STRAIGHT = Proc.new { |d| d }
      LEFT_TURN = {'<' => 'v', '>' => '^', '^' => '<', 'v' => '>'}.freeze
      RIGHT_TURN = {'<' => '^', '>' => 'v', '^' => '>', 'v' => '<'}.freeze
      SLASH_CURVE = {'<' => 'v',  'v' => '<', '>' => '^', '^' => '>'}.freeze
      BACKSLASH_CURVE = {'<' => '^', '^' => '<', '>' => 'v', 'v' => '>'}.freeze

      def initialize(direction)
        @direction = direction
        @intersection_options = [LEFT_TURN, STRAIGHT, RIGHT_TURN].cycle
      end

      attr_reader :direction

      def crash
        @direction = 'X'
      end

      def crashed?
        direction == 'X'
      end

      def move(track, position)
        raise 'crashed cart cannot move' if crashed?
        new_position(position).tap do |new_position|
          @direction = new_direction(track, new_position)
        end
      end

    private

      def new_position((x, y))
        case direction
        when '<' then [x - 1, y]
        when '>' then [x + 1, y]
        when '^' then [x, y - 1]
        when 'v' then [x, y + 1]
        end
      end

      def new_direction(track, position)
        path = case track[position]
               when '+' then @intersection_options.next
               when '|', '-' then STRAIGHT
               when '/' then SLASH_CURVE
               when '\\' then BACKSLASH_CURVE
               end
        path[direction]
      end
    end
  end
end
