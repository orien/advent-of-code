RSpec.describe AOC::Day9 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }
    [
      [9, 25, 32],
      [10, 1618, 8317],
      [13, 7999, 146373],
      [17, 1104, 2764],
      [21, 6111, 54718],
      [30, 5807, 37305],
    ].each do |players, last_marble, high_score|
      context "given '#{players} players; last marble is worth #{last_marble} points'" do
        let(:input) { <<~INPUT }
          #{players} players; last marble is worth #{last_marble} points
        INPUT
        it { should eq high_score }
      end
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }
    [
      [9, 25, 22563],
      [10, 16, 7932],
      [13, 79, 141778],
      [17, 11, 2720],
      [21, 61, 54718],
      [30, 58, 37305],
    ].each do |players, last_marble, high_score|
      context "given '#{players} players; last marble is worth #{last_marble} points'" do
        let(:input) { <<~INPUT }
          #{players} players; last marble is worth #{last_marble} points
        INPUT
        it { should eq high_score }
      end
    end
  end
end
