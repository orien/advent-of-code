RSpec.describe AOC::Day1 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "12"' do
      let(:input) { "12\n" }
      it { should eq 2 }
    end

    context 'given "14"' do
      let(:input) { "14\n" }
      it { should eq 2 }
    end

    context 'given "1969"' do
      let(:input) { "1969\n" }
      it { should eq 654 }
    end

    context 'given "100756"' do
      let(:input) { "100756\n" }
      it { should eq 33583 }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given "14"' do
      let(:input) { "14\n" }
      it { should eq 2 }
    end

    context 'given "1969"' do
      let(:input) { "1969\n" }
      it { should eq 966 }
    end

    context 'given "100756"' do
      let(:input) { "100756\n" }
      it { should eq 50346 }
    end
  end
end
