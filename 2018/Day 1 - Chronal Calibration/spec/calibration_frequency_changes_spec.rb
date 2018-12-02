require 'calibration_frequency_changes'

RSpec.describe CalibrationFrequencyChanges do
  subject(:calibration_frequency_changes) { described_class.new(filename) }

  let(:filename) { 'spec/4_changes.txt' }

  describe 'each' do
    it 'yields each frequency change' do
      expect { |block| calibration_frequency_changes.each(&block) }.to yield_successive_args(15, -6, 5, -15)
    end
  end
end
