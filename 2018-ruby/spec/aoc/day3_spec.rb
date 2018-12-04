RSpec.describe AOC::Day3 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "#1 @ 1,3: 4x4,  #2 @ 3,1: 4x4,  #3 @ 5,5: 2x2"' do
      let(:input) { <<~INPUT }
        #1 @ 1,3: 4x4
        #2 @ 3,1: 4x4
        #3 @ 5,5: 2x2
      INPUT
      it { should eq 4 }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given "#1 @ 1,3: 4x4,  #2 @ 3,1: 4x4,  #3 @ 5,5: 2x2"' do
      let(:input) { <<~INPUT }
        #1 @ 1,3: 4x4
        #2 @ 3,1: 4x4
        #3 @ 5,5: 2x2
      INPUT
      it { should eq '3' }
    end
  end
end
