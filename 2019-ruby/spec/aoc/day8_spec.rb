RSpec.describe AOC::Day8 do
  describe 'Image' do
    subject(:image) { AOC::Day8::Image.new(data, width, height) }

    context 'given [1,2,3,4,5,6,7,8,9,0,1,2], 3, 2' do
      let(:data) { [1,2,3,4,5,6,7,8,9,0,1,2] }
      let(:width) { 3 }
      let(:height) { 2 }
      its(:layers) { should eq [[1,2,3,4,5,6],[7,8,9,0,1,2]] }
    end

    context 'given [0,2,2,2,1,1,2,2,2,2,1,2,0,0,0,0], 2, 2' do
      let(:data) { [0,2,2,2,1,1,2,2,2,2,1,2,0,0,0,0] }
      let(:width) { 2 }
      let(:height) { 2 }
      its(:reduced_layer) { should eq [0,1,1,0] }
    end
  end
end
