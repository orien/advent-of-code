RSpec.describe AOC::Day1 do
  describe 'part1' do
    subject(:part1) { AOC::Day1.part1(StringIO.new(input)) }

    context 'given "+1, +1, +1"' do
      let(:input) { "+1\n+1\n+1\n" }
      it { should eq 3 }
    end

    context 'given "+1, +1, -2"' do
      let(:input) { "+1\n+1\n-2\n" }
      it { should eq 0 }
    end

    context 'given "-1, -2, -3"' do
      let(:input) { "-1\n-2\n-3\n" }
      it { should eq -6 }
    end
  end

  describe 'part2' do
    subject(:part2) { AOC::Day1.part2(StringIO.new(input)) }

    context 'given "+1, -1"' do
      let(:input) { "+1\n-1\n" }
      it { should eq 0 }
    end

    context 'given "+3, +3, +4, -2, -4"' do
      let(:input) { "+3\n+3\n+4\n-2\n-4\n" }
      it { should eq 10 }
    end

    context 'given "-6, +3, +8, +5, -6"' do
      let(:input) { "-6\n+3\n+8\n+5\n-6\n" }
      it { should eq 5 }
    end

    context 'given "+7, +7, -2, -7, -4"' do
      let(:input) { "+7\n+7\n-2\n-7\n-4\n" }
      it { should eq 14 }
    end
  end
end
