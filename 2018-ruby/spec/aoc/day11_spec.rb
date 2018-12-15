RSpec.describe AOC::Day11 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given serial 18' do
      let(:input) { '18' }
      it { should eq [33, 45] }
    end

    context 'given serial 42' do
      let(:input) { '42' }
      it { should eq [21, 61] }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given serial 18' do
      let(:input) { '18' }
      it { should eq [90, 269, 16] }
    end

    context 'given serial 42' do
      let(:input) { '42' }
      it { should eq [232, 251, 12] }
    end
  end

  describe 'power_level' do
    subject(:power_level) { described_class.power_level(serial, x, y) }
    [
      [[122, 79], 57, -5],
      [[217, 196], 39, 0],
      [[101, 153], 71, 4],
    ].each do |(x, y), serial, expected_power_level|
      context "given #{x}, #{y}, serial #{serial}" do
        let(:x) { x }
        let(:y) { y }
        let(:serial) { serial }
        it { should eq(expected_power_level) }
      end
    end
  end

  describe AOC::Day11::SummedAreaTable do
    context 'given the magic square example from Wikipedia' do
      subject(:summed_area_table) do
        described_class.new(6) do |x, y|
          [
            [31,  2,  4, 33,  5, 36],
            [12, 26,  9, 10, 29, 25],
            [13, 17, 21, 22, 20, 18],
            [24, 23, 15, 16, 14, 19],
            [30,  8, 28, 27, 11,  7],
            [ 1, 35, 34,  3, 32,  6],
          ][y - 1][x - 1]
        end
      end

      describe 'grid_area' do
        subject(:grid_area) { summed_area_table.grid_area(x, y, width, height) }

        context 'at: 3,4 width: 3, height: 2' do
          let(:x) { 3 }
          let(:y) { 4 }
          let(:width) { 3 }
          let(:height) { 2 }
          it { should eq(101 + 450 - 254 - 186) }
        end
      end

      describe 'area_at' do
        subject(:area_at) { summed_area_table.area_at(x, y) }

        let(:expected_areas) {
          [
            [ 31,  33,  37,  70,  75, 111],
            [ 43,  71,  84, 127, 161, 222],
            [ 56, 101, 135, 200, 254, 333],
            [ 80, 148, 197, 278, 346, 444],
            [110, 186, 263, 371, 450, 555],
            [111, 222, 333, 444, 555, 666],
          ]
        }

        (1..6).each do |y|
          (1..6).each do |x|
            context "at point #{x},#{y}" do
              let(:x) { x }
              let(:y) { y }
              it { should eq(expected_areas[y - 1][x - 1]) }
            end
          end
        end
      end
    end
  end
end
