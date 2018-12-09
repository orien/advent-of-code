module AOC
  module Day8
    def self.part1(input)
      sum_tree(build_tree(each_integer(input)))
    end

    def self.part2(input)
      value_tree(build_tree(each_integer(input)))
    end

    def self.sum_tree(node)
      node.metadata.sum + node.children.map(&method(:sum_tree)).sum
    end

    def self.value_tree(node)
      return 0 if node.nil?
      return node.metadata.sum if node.children.empty?
      node.metadata.map { |datum|
        value_tree(node.children[datum - 1]) if datum > 0
      }.sum
    end

    def self.build_tree(integers)
      quantity_of_children = integers.next
      quantity_of_metadata = integers.next
      children = Array.new(quantity_of_children) { build_tree(integers) }
      metadata = Array.new(quantity_of_metadata) { integers.next }
      Node.new(children, metadata)
    end

    def self.each_integer(input)
      Enumerator.new do |yielder|
        characters = ''
        input.each_char do |char|
          if char =~ /\d/
            characters << char
          else
            yielder << characters.to_i unless characters.empty?
            characters = ''
          end
        end
      end
    end

    class Node
      def initialize(children, metadata)
        @children, @metadata = children, metadata
      end
      attr_reader :children, :metadata
    end
  end
end
