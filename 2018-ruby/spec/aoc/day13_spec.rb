RSpec.describe AOC::Day13 do
  describe 'part1' do
    let(:input) { <<~'INPUT' }
      /->-\
      |   |  /----\
      | /-+--+-\  |
      | | |  | v  |
      \-+-/  \-+--/
        \------/
    INPUT
    subject(:part1) { described_class.part1(StringIO.new(input)) }
    it { should eq [7, 3] }
  end

  describe 'part2' do
    let(:input) { <<~'INPUT' }
      />-<\
      |   |
      | /<+-\
      | | | v
      \>+</ |
        |   ^
        \<->/
    INPUT
    subject(:part2) { described_class.part2(StringIO.new(input)) }
    it { should eq [6, 4] }
  end
end
