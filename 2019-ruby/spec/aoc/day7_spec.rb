RSpec.describe AOC::Day7 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0"' do
      let(:input) { "3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0\n" }
      it { should eq 43210 }
    end

    context 'given "3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0"' do
      let(:input) { "3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0\n" }
      it { should eq 54321 }
    end

    context 'given "3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0"' do
      let(:input) { "3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0\n" }
      it { should eq 65210 }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given "3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5"' do
      let(:input) { "3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5\n" }
      it { should eq 139629729 }
    end

    context 'given "3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54,-5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,4,53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10"' do
      let(:input) { "3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54,-5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,4,53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10\n" }
      it { should eq 18216 }
    end
  end

  describe 'Program' do
    subject(:program) { AOC::Day7::Program.new(state, input, output) }
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
  end
end
