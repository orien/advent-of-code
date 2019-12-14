module AOC
  module Day8
    def self.part1(input)
      image = Image.new(input.first.chomp.chars.map(&:to_i), 25, 6)
      layer = image.layers.min { |layer1, layer2| layer1.count(0) <=> layer2.count(0) }
      layer.count(1) * layer.count(2)
    end

    def self.part2(input)
      image = Image.new(input.first.chomp.chars.map(&:to_i), 25, 6)
      image.to_s
    end

    class Image
      def initialize(data, width, height)
        @width = width
        image_size = width * height
        @layers = data.each_slice(image_size).to_a
      end

      attr_reader :layers

      def reduced_layer
        @reduced_layer ||= begin
          first, *rest = @layers
          first.zip(*rest).map { |pixel_layers|
            pixel_layers.reverse.reduce { |below, pixel| pixel == 2 ? below : pixel }
          }
        end
      end

      def to_s
        reduced_layer.each_with_index.map { |pixel, i|
          pixel = pixel == 1 ? "▮" : " "
          i % @width == 0 ? "\n#{pixel}" : pixel
        }.join
      end
    end
  end
end
