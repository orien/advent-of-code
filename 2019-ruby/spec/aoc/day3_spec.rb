RSpec.describe AOC::Day3 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "R75,D30,R83,U83,L12,D49,R71,U7,L72" and "U62,R66,U55,R34,D71,R55,D58,R83"' do
      let(:input) { "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83\n" }
      it { should eq 159 }
    end

    context 'given "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51" and "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"' do
      let(:input) { "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7\n" }
      it { should eq 135 }
    end
  end

  describe 'part2' do
    subject(:part1) { described_class.part2(StringIO.new(input)) }

    context 'given "R75,D30,R83,U83,L12,D49,R71,U7,L72" and "U62,R66,U55,R34,D71,R55,D58,R83 "' do
      let(:input) { "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83 \n" }
      it { should eq 610 }
    end

    context 'given "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51" and "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 "' do
      let(:input) { "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7 \n" }
      it { should eq 410 }
    end
  end

  describe 'instructions' do
    subject(:instructions) { described_class.instructions(input_line) }

    context 'given "U1,D2,R3,L17"' do
      let(:input_line) { "U1,D2,R3,L17" }
      it { should eq [["U", 1], ["D", 2], ["R", 3], ["L", 17]] }
    end
  end

  describe 'path' do
    subject(:path) { described_class.path(instructions, [0, 0], []) }

    context 'given [["U", 1], ["L", 2], ["D", 3], ["R", 4]]' do
      let(:instructions) { [["U", 1], ["L", 2], ["D", 3], ["R", 4]] }
      it { should eq [[0, 1], [-1, 1], [-2, 1], [-2, 0], [-2, -1], [-2, -2], [-1, -2], [0, -2], [1, -2], [2, -2]] }
    end
  end

  describe 'manhattan_distance' do
    subject(:manhattan_distance) { described_class.manhattan_distance(point1, point2) }

    context 'given [0,0] and [6,6]' do
      let(:point1) { [0, 0] }
      let(:point2) { [6, 6] }
      it { should eq 12 }
    end

    context 'given [0,0] and [-5,7]' do
      let(:point1) { [0, 0] }
      let(:point2) { [-5, 7] }
      it { should eq 12 }
    end
  end
end
