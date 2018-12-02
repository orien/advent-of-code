require 'set'

class CalibrationFrequencyChanges
  include Enumerable

  def initialize(filename)
    @filename = filename
  end

  alias_method :resulting_frequency, :sum

  def each
    File.open(@filename, 'r') do |file|
      file.each_line do |line|
        yield line.to_i
      end
    end
  end

  def repeated_frequency
    lazy.cycle.each_with_object({freq: 0, past_freq: Set.new}) do |change, state|
      state[:freq] += change
      return state[:freq] unless state[:past_freq].add?(state[:freq])
    end
  end
end
