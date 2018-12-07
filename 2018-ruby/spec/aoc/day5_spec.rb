RSpec.describe AOC::Day5 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "aA"' do
      let(:input) { 'aA' }
      it { should eq 0 }
    end

    context 'given "abBA"' do
      let(:input) { 'abBA' }
      it { should eq 0 }
    end

    context 'given "abAB"' do
      let(:input) { 'abAB' }
      it { should eq 4 }
    end

    context 'given "aabAAB"' do
      let(:input) { 'aabAAB' }
      it { should eq 6 }
    end

    context 'given "dabAcCaCBAcCcaDA"' do
      let(:input) { 'dabAcCaCBAcCcaDA' }
      it { should eq 10 }
    end

    context 'given "aAaAaAaAaA"' do
      let(:input) { 'aAaAaAaAaA' }
      it { should eq 0 }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given "dabAcCaCBAcCcaDA"' do
      let(:input) { 'dabAcCaCBAcCcaDA' }
      it { should eq 4 }
    end
  end
end
