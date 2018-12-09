RSpec.describe AOC::Day8 do
  context 'given "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"' do
    let(:input) { <<~INPUT }
      2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2
    INPUT

    describe 'part1' do
      subject(:part1) { described_class.part1(StringIO.new(input)) }
      it { should eq 138 }
    end

    describe 'part2' do
      subject(:part2) { described_class.part2(StringIO.new(input)) }
      it { should eq 66 }
    end
  end
end
