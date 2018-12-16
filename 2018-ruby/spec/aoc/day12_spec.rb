RSpec.describe AOC::Day12 do
  context 'given some content' do
    let(:input) { <<~INPUT }
      initial state: #..#.#..##......###...###

      ...## => #
      ..#.. => #
      .#... => #
      .#.#. => #
      .#.## => #
      .##.. => #
      .#### => #
      #.#.# => #
      #.### => #
      ##.#. => #
      ##.## => #
      ###.. => #
      ###.# => #
      ####. => #
    INPUT

    describe 'part1' do
      subject(:part1) { described_class.part1(StringIO.new(input)) }
      it { should eq 325 }
    end

    describe 'part2' do
      subject(:part2) { described_class.part2(StringIO.new(input)) }
      it { should eq 999999999374 }
    end
  end
end
