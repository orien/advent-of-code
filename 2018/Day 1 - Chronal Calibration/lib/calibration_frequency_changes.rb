class CalibrationFrequencyChanges
  include Enumerable

  def initialize(filename)
    @filename = filename
  end

  def each
    File.open(@filename, 'r') do |file|
      file.each_line do |line|
        yield line.to_i
      end
    end
  end
end
