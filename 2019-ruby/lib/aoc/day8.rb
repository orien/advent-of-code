module AOC
  module Day8
    def self.part1(input)
      image = Image.new(input.first.chomp.chars.map(&:to_i), 25, 6)
      layer = image.layers.min { |layer1, layer2| layer1.count(0) <=> layer2.count(0) }
      layer.count(1) * layer.count(2)
    end

    def self.part2(input)
    end

    class Image
      def initialize(data, width, height)
        image_size = width * height
        @layers = data.each_slice(image_size).to_a
      end

      attr_reader :layers
    end
  end
end
