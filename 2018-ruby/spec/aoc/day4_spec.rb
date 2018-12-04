RSpec.describe AOC::Day4 do
  context 'given this sample data' do
    let(:input) { <<~INPUT }
      [1518-11-01 00:00] Guard #10 begins shift
      [1518-11-01 00:05] falls asleep
      [1518-11-01 00:25] wakes up
      [1518-11-01 00:30] falls asleep
      [1518-11-01 00:55] wakes up
      [1518-11-01 23:58] Guard #99 begins shift
      [1518-11-02 00:40] falls asleep
      [1518-11-02 00:50] wakes up
      [1518-11-03 00:05] Guard #10 begins shift
      [1518-11-03 00:24] falls asleep
      [1518-11-03 00:29] wakes up
      [1518-11-04 00:02] Guard #99 begins shift
      [1518-11-04 00:36] falls asleep
      [1518-11-04 00:46] wakes up
      [1518-11-05 00:03] Guard #99 begins shift
      [1518-11-05 00:45] falls asleep
      [1518-11-05 00:55] wakes up
    INPUT

    describe 'part1' do
      subject(:part1) { described_class.part1(StringIO.new(input)) }
      it { should eq 240 }
    end

    describe 'part2' do
      subject(:part2) { described_class.part2(StringIO.new(input)) }
      it { should eq 4455 }
    end
  end
end
