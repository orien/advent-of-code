RSpec.describe AOC::Day5 do
  describe 'process' do
    subject(:process) { described_class.process(state, 0) }

    describe 'add' do
      context 'given [1,0,0,0,99]' do
        let(:state) { [1,0,0,0,99] }
        it { should eq [2,0,0,0,99] }
      end
    end

    describe 'multiply' do
      context 'given [2,3,0,3,99]'do
        let(:state) { [2,3,0,3,99] }
        it { should eq [2,3,0,6,99] }
      end

      context 'given [2,4,4,5,99,0]' do
        let(:state) { [2,4,4,5,99,0] }
        it { should eq [2,4,4,5,99,9801] }
      end
    end

    describe 'combinations' do
      context 'given [1,1,1,4,99,5,6,0,99]' do
        let(:state) { [1,1,1,4,99,5,6,0,99] }
        it { should eq [30,1,1,4,2,5,6,0,99] }
      end

      context 'given [1,9,10,3,2,3,11,0,99,30,40,50]' do
        let(:state) { [1,9,10,3,2,3,11,0,99,30,40,50] }
        it { should eq [3500,9,10,70,2,3,11,0,99,30,40,50] }
      end
    end

    describe 'parameter modes' do
      context 'given [1002,4,3,4,33,99]' do
        let(:state) { [1002, 4, 3, 4, 33, 99] }
        it { should eq [1002, 4, 3, 4, 99, 99] }
      end
    end

    describe 'output' do
      context 'given [4,3,99,100]' do
        let(:state) { [4, 3, 99, 100] }
        specify { expect { process }.to output("100").to_stdout }
      end
    end
  end
end
