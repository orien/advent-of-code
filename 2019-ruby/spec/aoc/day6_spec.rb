RSpec.describe AOC::Day6 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "COM)B B)C C)D D)E E)F B)G G)H D)I E)J J)K K)L"' do
      let(:input) { <<~INPUT }
        COM)B
        B)C
        C)D
        D)E
        E)F
        B)G
        G)H
        D)I
        E)J
        J)K
        K)L
      INPUT
      it { should eq 42 }
    end
  end
end
