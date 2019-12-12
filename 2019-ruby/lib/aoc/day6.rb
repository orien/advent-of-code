module AOC
  module Day6
    def self.part1(input)
      nodes = input.map { |line| line.chomp.split(")") }
        .reduce(Hash.new { |h, k| h[k] = [] }) { |h, (a, b)|
          h[a] << h[b]
          h
        }
      traverse(nodes["COM"], 0)
    end

    def self.part2(input)
    end

    def self.traverse(node, depth)
      depth + node.reduce(0) { |sum, child| sum + traverse(child, depth + 1) }
    end
  end
end
