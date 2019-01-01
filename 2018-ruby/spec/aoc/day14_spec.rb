RSpec.describe AOC::Day14 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given input "2"' do
      let(:input) { "2\n" }
      it { should eq '1010124515' }
    end

    context 'given input "5"' do
      let(:input) { "5\n" }
      it { should eq '0124515891' }
    end

    context 'given input "9"' do
      let(:input) { "9\n" }
      it { should eq '5158916779' }
    end

    context 'given input "18"' do
      let(:input) { "18\n" }
      it { should eq '9251071085' }
    end

    context 'given input "2018"' do
      let(:input) { "2018\n" }
      it { should eq '5941429882' }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given input "51589"' do
      let(:input) { "51589\n" }
      it { should eq 9 }
    end

    context 'given input "01245"' do
      let(:input) { "01245\n" }
      it { should eq 5 }
    end

    context 'given input "92510"' do
      let(:input) { "92510\n" }
      it { should eq 18 }
    end

    context 'given input "59414"' do
      let(:input) { "59414\n" }
      it { should eq 2018 }
    end
  end
end
