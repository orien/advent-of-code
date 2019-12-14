RSpec.describe AOC::Day9 do
  describe 'Program' do
    subject(:program) { AOC::Day9::Program.new(state, input, output) }
    let(:input) { [] }
    let(:output) { [] }
    before { program.process }

    describe 'add' do
      context 'given [1,0,0,0,99]' do
        let(:state) { [1,0,0,0,99] }
        its(:data) { should eq [2,0,0,0,99] }
      end
    end

    describe 'multiply' do
      context 'given [2,3,0,3,99]'do
        let(:state) { [2,3,0,3,99] }
        its(:data) { should eq [2,3,0,6,99] }
      end

      context 'given [2,4,4,5,99,0]' do
        let(:state) { [2,4,4,5,99,0] }
        its(:data) { should eq [2,4,4,5,99,9801] }
      end
    end

    describe 'combinations' do
      context 'given [1,1,1,4,99,5,6,0,99]' do
        let(:state) { [1,1,1,4,99,5,6,0,99] }
        its(:data) { should eq [30,1,1,4,2,5,6,0,99] }
      end

      context 'given [1,9,10,3,2,3,11,0,99,30,40,50]' do
        let(:state) { [1,9,10,3,2,3,11,0,99,30,40,50] }
        its(:data) { should eq [3500,9,10,70,2,3,11,0,99,30,40,50] }
      end
    end

    describe 'parameter modes' do
      context 'given [1002,4,3,4,33,99]' do
        let(:state) { [1002, 4, 3, 4, 33, 99] }
        its(:data) { should eq [1002, 4, 3, 4, 99, 99] }
      end
    end

    describe 'output' do
      context 'given [4,3,99,100]' do
        let(:state) { [4, 3, 99, 100] }
        its(:data) { should eq [4, 3, 99, 100] }
        its(:output) { should eq [100] }
      end
    end

    describe 'equals' do
      context 'given [3,9,8,9,10,9,4,9,99,-1,8]' do
        let(:state) { [3,9,8,9,10,9,4,9,99,-1,8] }

        context 'input [8]' do
          let(:input) { [8] }
          its(:data) { should eq [3,9,8,9,10,9,4,9,99,1,8] }
          its(:output) { should eq [1] }
        end

        context 'input [9]' do
          let(:input) { [9] }
          its(:data) { should eq [3,9,8,9,10,9,4,9,99,0,8] }
          its(:output) { should eq [0] }
        end
      end

      context 'given [3,3,1108,-1,8,3,4,3,99]' do
        let(:state) { [3,3,1108,-1,8,3,4,3,99] }

        context 'input [8]' do
          let(:input) { [8] }
          its(:data) { should eq [3,3,1108,1,8,3,4,3,99] }
          its(:output) { should eq [1] }
        end

        context 'input [9]' do
          let(:input) { [9] }
          its(:data) { should eq [3,3,1108,0,8,3,4,3,99] }
          its(:output) { should eq [0] }
        end
      end
    end

    describe 'less than' do
      context 'given [3,9,7,9,10,9,4,9,99,-1,8]' do
        let(:state) { [3,9,7,9,10,9,4,9,99,-1,8] }

        context 'input [8]' do
          let(:input) { [8] }
          its(:data) { should eq [3,9,7,9,10,9,4,9,99,0,8] }
          its(:output) { should eq [0] }
        end

        context 'input [7]' do
          let(:input) { [7] }
          its(:data) { should eq [3,9,7,9,10,9,4,9,99,1,8] }
          its(:output) { should eq [1] }
        end
      end

      context 'given [3,3,1107,-1,8,3,4,3,99]' do
        let(:state) { [3,3,1107,-1,8,3,4,3,99] }

        context 'input [8]' do
          let(:input) { [8] }
          its(:data) { should eq [3,3,1107,0,8,3,4,3,99] }
          its(:output) { should eq [0] }
        end

        context 'input [7]' do
          let(:input) { [7] }
          its(:data) { should eq [3,3,1107,1,8,3,4,3,99] }
          its(:output) { should eq [1] }
        end
      end
    end

    describe 'jumps' do
      context 'given [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]' do
        let(:state) { [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9] }

        context 'input [0]' do
          let(:input) { [0] }
          its(:data) { should eq [3,12,6,12,15,1,13,14,13,4,13,99,0,0,1,9] }
          its(:output) { should eq [0] }
        end

        context 'input [1]' do
          let(:input) { [1] }
          its(:data) { should eq [3,12,6,12,15,1,13,14,13,4,13,99,1,1,1,9] }
          its(:output) { should eq [1] }
        end
      end

      context 'given [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]' do
        let(:state) { [3,3,1105,-1,9,1101,0,0,12,4,12,99,1] }

        context 'input [0]' do
          let(:input) { [0] }
          its(:data) { should eq [3,3,1105,0,9,1101,0,0,12,4,12,99,0] }
          its(:output) { should eq [0] }
        end

        context 'input [1]' do
          let(:input) { [1] }
          its(:data) { should eq [3,3,1105,1,9,1101,0,0,12,4,12,99,1] }
          its(:output) { should eq [1] }
        end
      end
    end

    describe 'relative mode' do
      context 'given [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]' do
        let(:state) { [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99] }
        let(:input) { [] }
        its(:output) { should eq [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99] }
      end

      context 'given [1102,34915192,34915192,7,4,7,99,0]' do
        let(:state) { [1102,34915192,34915192,7,4,7,99,0] }
        let(:input) { [] }
        its(:output) { should eq [1219070632396864] }
      end

      context 'given [104,1125899906842624,99]' do
        let(:state) { [104,1125899906842624,99] }
        let(:input) { [] }
        its(:output) { should eq [1125899906842624] }
      end
    end
  end
end
