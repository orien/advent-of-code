RSpec.describe AOC::Day7 do
  context 'given some content' do
    let(:input) { <<~INPUT }
        Step C must be finished before step A can begin.
        Step C must be finished before step F can begin.
        Step A must be finished before step B can begin.
        Step A must be finished before step D can begin.
        Step B must be finished before step E can begin.
        Step D must be finished before step E can begin.
        Step F must be finished before step E can begin.
    INPUT

    describe 'part1' do
      subject(:part1) { described_class.part1(StringIO.new(input)) }
      it { should eq 'CABDFE' }
    end

    describe 'part2' do
      subject(:part2) { described_class.part2(StringIO.new(input), number_of_workers: 2, base_step_time: 0) }
      it { should eq 15 }
    end
  end
end
