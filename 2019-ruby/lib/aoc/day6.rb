module AOC
  module Day6
    def self.part1(input)
      traverse(nodes(input)["COM"], 0)
    end

    def self.part2(input)
      n = nodes(input)
      santa = n["SAN"]
      you = n["YOU"]
      santas_orbit_path = ancestors(santa)
      your_orbit_path = ancestors(you) { |node| santas_orbit_path.include?(node) }
      santas_orbit_path.index(your_orbit_path.last) + your_orbit_path.size - 1
    end

    def self.nodes(input)
      input.map { |line| line.chomp.split(")") }
        .reduce(Hash.new { |h, k| h[k] = Node.new(k) }) { |h, (a, b)|
          h[a].children << h[b]
          h[b].parent = h[a]
          h
        }
    end

    def self.ancestors(node, acc = [], &block)
      if node.parent.nil? || block&.call(node)
        acc
      else
        ancestors(node.parent, acc + [node.parent], &block)
      end
    end

    def self.traverse(node, depth)
      depth + node.children.reduce(0) { |sum, child| sum + traverse(child, depth + 1) }
    end

    class Node
      def initialize(name)
        @name = name
        @parent = nil
        @children = []
      end

      attr_reader :name, :children
      attr_accessor :parent
    end
  end
end
