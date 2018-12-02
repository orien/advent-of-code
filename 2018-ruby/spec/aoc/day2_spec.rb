RSpec.describe AOC::Day2 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "abcdef, bababc, abbcde, abcccd, aabcdd, abcdee, ababab"' do
      let(:input) { "abcdef\nbababc\nabbcde\nabcccd\naabcdd\nabcdee\nababab\n" }
      it { should eq 12 }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given "abcde, fghij, klmno, pqrst, fguij, axcye, wvxyz"' do
      let(:input) { "abcde\nfghij\nklmno\npqrst\nfguij\naxcye\nwvxyz\n" }
      it { should eq 'fgij' }
    end
  end
end
