RSpec.describe AOC::Day4 do
  describe 'part1' do
    subject(:part1) { described_class.part1(StringIO.new(input)) }

    context 'given "156218-652527"' do
      let(:input) { "156218-652527\n" }
      it { should eq 1694 }
    end
  end

  describe 'part2' do
    subject(:part2) { described_class.part2(StringIO.new(input)) }

    context 'given "156218-652527"' do
      let(:input) { "156218-652527\n" }
      it { should eq 1148 }
    end
  end

  describe 'valid2?' do
    subject(:valid2?) { described_class.valid2?(password) }

    context 'given 112233' do
      let(:password) { 112233 }
      it { should be true }
    end

    context 'given 123444' do
      let(:password) { 123444 }
      it { should be false }
    end

    context 'given 111122' do
      let(:password) { 111122 }
      it { should be true }
    end

    context 'given 111111' do
      let(:password) { 111111 }
      it { should be false }
    end

    context 'given 223450' do
      let(:password) { 223450 }
      it { should be false }
    end

    context 'given 123789' do
      let(:password) { 123789 }
      it { should be false }
    end
  end

  describe 'valid?' do
    subject(:valid?) { described_class.valid?(password) }

    context 'given 111111' do
      let(:password) { 111111 }
      it { should be true }
    end

    context 'given 223450' do
      let(:password) { 223450 }
      it { should be false }
    end

    context 'given 123789' do
      let(:password) { 123789 }
      it { should be false }
    end
  end
end
