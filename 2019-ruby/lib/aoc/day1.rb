module AOC
  module Day1
    def self.part1(input)
      input.map(&:to_i).map(&method(:fuel_for_mass)).sum
    end

    def self.part2(input)
      input.map(&:to_i).map(&method(:fuel_for_mass_plus_fuel)).sum
    end

    def self.fuel_for_mass(mass)
      fuel = mass / 3 - 2
    end

    def self.fuel_for_mass_plus_fuel(mass, fuel = 0)
      extra_fuel = fuel_for_mass(mass)
      if extra_fuel.positive?
        fuel_for_mass_plus_fuel(extra_fuel, fuel + extra_fuel)
      else
        fuel
      end
    end
  end
end
