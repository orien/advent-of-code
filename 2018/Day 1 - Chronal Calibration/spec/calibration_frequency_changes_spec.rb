require 'calibration_frequency_changes'

RSpec.describe CalibrationFrequencyChanges do
  subject(:calibration_frequency_changes) { described_class.new(filename) }

  describe 'each' do
    let(:filename) { 'spec/4_changes.txt' }

    it 'yields each frequency change' do
      expect { |block| calibration_frequency_changes.each(&block) }.to yield_successive_args(15, -6, 5, -15)
    end
  end

  describe 'resulting_frequency' do
    subject(:resulting_frequency) { calibration_frequency_changes.resulting_frequency }

    let(:filename) { 'spec/4_changes.txt' }

    it 'identifies the frequency' do
      expect(resulting_frequency).to eq(-1)
    end
  end

  describe 'repeated_frequency' do
    subject(:repeated_frequency) { calibration_frequency_changes.repeated_frequency }

    let(:filename) { 'spec/repeated_frequency_14.txt' }

    it 'identifies the frequency' do
      expect(repeated_frequency).to eq(14)
    end
  end
end
