RSpec.describe PDF417::Canvases::SVG do
  describe '#initialize' do
    it 'allows for additional attributes' do
      the_svg = PDF417::Canvases::SVG.new( { 'fee' => 'something', 'fi' => 'something_else', 'foe' =>'fum' })
      expect(the_svg.to_s).to include("fee='something'")
    end

  end
end
