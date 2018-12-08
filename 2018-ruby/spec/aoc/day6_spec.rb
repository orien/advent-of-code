RSpec.describe AOC::Day6 do
  context 'given "1, 1; 1, 6; 8, 3; 3, 4; 5, 5; 8, 9"' do
    let(:input) { <<~INPUT }
        1, 1
        1, 6
        8, 3
        3, 4
        5, 5
        8, 9
    INPUT

    describe 'part1' do
      subject(:part1) { described_class.part1(StringIO.new(input)) }
      it { should eq 17 }
    end

    describe 'part2' do
      subject(:part2) { described_class.part2(StringIO.new(input), 32) }
      it { should eq 16 }
    end
  end
end
