module AOC
  module Day4
    def self.part1(input)
      from, to = input.readline.split("-").map(&:to_i)
      (from..to).select(&method(:valid?)).count
    end

    def self.part2(input)
      from, to = input.readline.split("-").map(&:to_i)
      (from..to).select(&method(:valid2?)).count
    end

    def self.valid?(password)
      consecutive_digits = password.digits.each_cons(2).to_a
      consecutive_digits.all? { |(num1, num2)| num1 >= num2 } &&
        consecutive_digits.any? { |(num1, num2)| num1 == num2 }
    end

    def self.valid2?(password)
      digits = password.digits
      digits.each_cons(2).all? { |(num1, num2)| num1 >= num2 } &&
        digits.slice_when { |num1, num2| num1 != num2 }.any? { |group| group.size == 2 }
    end
  end
end
