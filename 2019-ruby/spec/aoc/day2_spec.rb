RSpec.describe AOC::Day2 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "1,0,0,0,99,0,0,0,0,0,0,0,5"' do
      let(:input) { "1,0,0,0,99,0,0,0,0,0,0,0,5\n" }
      it { should eq 7 }
    end
  end

  describe 'process' do
    subject(:process) { described_class.process(input, 0) }

    context 'given [1,0,0,0,99]' do
      let(:input) { [1,0,0,0,99] }
      it { should eq [2,0,0,0,99] }
    end

    context 'given [2,3,0,3,99]'do
      let(:input) { [2,3,0,3,99] }
      it { should eq [2,3,0,6,99] }
    end

    context 'given [2,4,4,5,99,0]' do
      let(:input) { [2,4,4,5,99,0] }
      it { should eq [2,4,4,5,99,9801] }
    end

    context 'given [1,1,1,4,99,5,6,0,99]' do
      let(:input) { [1,1,1,4,99,5,6,0,99] }
      it { should eq [30,1,1,4,2,5,6,0,99] }
    end

    context 'given [1,9,10,3,2,3,11,0,99,30,40,50]' do
      let(:input) { [1,9,10,3,2,3,11,0,99,30,40,50] }
      it { should eq [3500,9,10,70,2,3,11,0,99,30,40,50] }
    end
  end

  describe 'operate' do
    context 'given [1,0,0,0],0,:+' do
      subject { described_class.operate([1,0,0,0], 0, :+) }
      it { should eq [2,0,0,0]}
    end

    context 'given [1,0,0,0],0,:+' do
      subject { described_class.operate([2,3,0,3], 0, :*) }
      it { should eq [2,3,0,6]}
    end
  end
end
