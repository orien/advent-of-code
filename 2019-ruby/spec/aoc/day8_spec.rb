RSpec.describe AOC::Day8 do
  describe 'Image' do
    subject(:image) { AOC::Day8::Image.new(data, width, height) }

    context 'given [1,2,3,4,5,6,7,8,9,0,1,2], 3, 2' do
      let(:data) { [1,2,3,4,5,6,7,8,9,0,1,2] }
      let(:width) { 3 }
      let(:height) { 2 }
      its(:layers) { should eq [[1,2,3,4,5,6],[7,8,9,0,1,2]] }
    end
  end
end
